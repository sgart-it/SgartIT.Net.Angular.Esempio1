import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { filter } from 'rxjs';
import { RouteDataService } from '../services/route-data.service';
import { HeaderComponent } from '../components/header/header.component';
import { ShowErrorsComponent } from '../components/show-errors/show-errors.component';
import { LoadingComponent } from '../components/loading/loading.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  standalone: true,
  imports: [RouterOutlet, HeaderComponent, ShowErrorsComponent, LoadingComponent]
})
export class AppComponent implements OnInit {
  public title: string = 'Title ???';

  constructor(
    private readonly router: Router,
    private readonly routeDataService: RouteDataService
  ) { }

  ngOnInit() {
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe(_ =>
        this.title = this.routeDataService.getTitle()
      );
  }

  
}
