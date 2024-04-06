import { Component, Inject, Input } from '@angular/core';
import { APP_CONFIG, AppConfig } from '../../models/app-config';
import { AppUser } from '../../models/app-user';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrl: './header.component.css',
  standalone: true,
  imports: []
})
export class HeaderComponent {
  constructor(@Inject(APP_CONFIG) config: AppConfig) {
    console.log("header config", config);
    this.title = config.appTitle;
    this.currentUser = config.currentUser;
  }

  title: string;
  currentUser: AppUser;
}
