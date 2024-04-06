import { Component } from '@angular/core';
import { Location } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { PuntiVenditaService } from '../../services/punti-vendita.service';
import { PuntoVenditaDettaglio } from '../../models/punto-vendita-dettaglio';
import { DetailTabsComponent } from './detail-tabs/detail-tabs.component';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { FormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { PuntoVenditaUpdate } from '../../models/punto-vendita-update';

@Component({
  selector: 'page-detail',
  templateUrl: './detail.component.html',
  styleUrl: './detail.component.css',
  standalone: true,
  imports: [
    DetailTabsComponent,
    MatSlideToggleModule,
    FormsModule,
    MatIconModule,
    MatInputModule,
    RouterModule
  ],
})
export class DetailComponent {
  item: PuntoVenditaDettaglio = {
    puntoVenditaId: 0,
    descrizione: '',
    codice: '',
    citta: '',
    email: '',
    telefono: '',
    abilitato: false,
    dataUltimaModifica: new Date(),
    prodotti: [],
    servizi: [],
    carte: []
  };

  currentTabId = 0;

  //prodotti: Prodotto[] = [];
  //servizi: Servizio[] = [];
  //carte: Carta[] = [];

  constructor(
    private route: ActivatedRoute,
    private service: PuntiVenditaService,
    private location: Location
  ) { }

  ngOnInit() {
    this.getDetail();
  }

  getDetail(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));

    console.log(id);

    this.service.detail(id)
      .subscribe({
        next: response => {
          this.item = response.data;
          //this.prodotti = data.prodotti;
          //this.servizi = data.servizi;
          //this.carte = data.carte;

          //this.item.prodotti = [];
          //this.item.servizi = [];
          //this.item.carte = [];
        }
      });
  }

  save(): void {
    const data: PuntoVenditaUpdate = {
      email: this.item.email,
      telefono: this.item.telefono,
      abilitato: this.item.abilitato,
      prodotti: this.item.prodotti.filter(x=> x.selected===true).map(x => x.prodottoId),
      servizi: this.item.servizi.filter(x => x.selected === true).map(x => x.servizioId)
    };
    this.service.save(this.item.puntoVenditaId, data).subscribe({
      next: response => {
        this.location.back();
      }
    });
  }

}
