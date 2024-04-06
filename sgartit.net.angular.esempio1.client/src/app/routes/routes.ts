import { Route } from '@angular/router';
import { HomeComponent } from '../pages/home/home.component';
import { DetailComponent } from '../pages/detail/detail.component';
import { InfoComponent } from '../pages/info/info.component';
import { PageNotFoundComponent } from '../pages/page-not-found/page-not-found.component';

export const APP_ROUTES: Route[] = [
  { path: '', component: HomeComponent, pathMatch: 'full' },
  { path: 'detail/:id', component: DetailComponent },
  { path: 'info', component: InfoComponent },
  { path: '**', component: PageNotFoundComponent }
];

//@NgModule({
//  imports: [RouterModule.forRoot(routes)],
//  exports: [RouterModule]
//})
//export class AppRoutingModule { }
