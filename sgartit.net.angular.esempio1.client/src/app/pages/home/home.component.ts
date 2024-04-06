import { Component, OnInit } from '@angular/core';
import { PuntiVenditaService } from '../../services/punti-vendita.service';
import { PuntoVendita } from '../../models/punto-vendita';
import { RouterModule } from '@angular/router';
import { FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatDividerModule } from '@angular/material/divider';
import { MatListModule } from '@angular/material/list';
import { MatInputModule } from '@angular/material/input';
import { MatIconModule } from '@angular/material/icon';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { AsyncPipe } from '@angular/common';
import { MatFormFieldModule } from '@angular/material/form-field';
import { StateComponent } from '../../states/base/state-component';
import { HomeState } from '../../states/home-state';

@Component({
  selector: 'page-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
  standalone: true,
  imports: [
    FormsModule,
    RouterModule,
    MatDividerModule,
    MatListModule,
    MatInputModule,
    MatIconModule,
    MatFormFieldModule,
    MatAutocompleteModule,
    ReactiveFormsModule,
    AsyncPipe
  ]
})
export class HomeComponent extends StateComponent<HomeState> implements OnInit {

  searchControl = new FormControl<string>('');
  items: PuntoVendita[] = [];
  filteredItems: PuntoVendita[] = [];

  constructor(
    private service: PuntiVenditaService,
  ) {
    super(HomeState)
  }

  ngOnInit() {
    this.searchControl.setValue(this.pageState.searchText);

    this.searchControl.valueChanges.subscribe({
      next: value => {
        const txt = value as string;
        this.setState({ searchText: txt });
        this.filteredItems = this._filter(txt);
      }
    });

    //.pipe(
    //  startWith(''),
    //  map(value => {
    //    console.log("v", value);
    //    return this._filter(value as string);
    //  })
    //);

    this.refresh();
  }

  override onStateChanged(oldValues: Partial<HomeState>, newValues: Partial<HomeState>): void {
    console.log('onStateChanged', oldValues, newValues);
  }

  refresh() {
    this.getListAll();
  }


  getListAll() {
    //this.searchControl.setValue('');
    this.items.length = 0;

    this.service.list('').subscribe({
      next: response => {
        console.log("response", response);
        if (response.data?.length > 0) {
          this.items = response.data;
          this.filteredItems = this._filter(this.searchControl.value as string);
          //this.searchControl.reset();
        }
      },
      error: err => console.error(err),
      complete: () => console.log('complete')
    });
  }

  private _filter(text: string): PuntoVendita[] {
    if (text == null || text.length === 0)
      return this.items;

    const filterValue = text?.toLowerCase();
    var a = this.items.filter(item => item.descrizione.toLowerCase().includes(filterValue)
      || item.codice.toLowerCase().includes(filterValue)
      || item.citta.toLowerCase().includes(filterValue)
    );
    //console.log("filter", a, this.items);
    return a;
  }

}
