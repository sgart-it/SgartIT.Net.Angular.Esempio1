import { Component, EventEmitter, Input, Output } from '@angular/core';
import { MatTabsModule } from '@angular/material/tabs';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'page-detail-tabs',
  templateUrl: './detail-tabs.component.html',
  styleUrl: './detail-tabs.component.css',
  standalone: true,
  imports: [MatTabsModule, MatButtonModule]
})
export class DetailTabsComponent {
  private _currentTab = 0;
  tabs = [
    { id: 0, text: "Generali" },
    { id: 1, text: "Prodotti" },
    { id: 2, text: "Servizi" },
    { id: 3, text: "Carte" }
  ];

  @Output() currentTabChange = new EventEmitter<number>();

  @Input()
  get currentTab(): any { return this._currentTab; }
  set currentTab(d: any) {
    this._currentTab = d;
    this.currentTabChange.emit(this._currentTab);
  };
}

