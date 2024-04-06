import { Injectable } from "@angular/core";
import { ActivatedRoute, ActivatedRouteSnapshot, Data } from "@angular/router";

@Injectable({
  providedIn: "root"
})
export class RouteDataService {

  constructor(private route: ActivatedRoute) { }

  getTitle(): string {
    return this.getRouteSnapshot().title ?? '';
  }

  get(): Data {
    return this.getRouteSnapshot().data;
  }

  private getRouteSnapshot(): ActivatedRouteSnapshot {
    let route = this.route;

    while (route.firstChild) {
      route = route.firstChild;
    }

    return route.snapshot;
  }
}
