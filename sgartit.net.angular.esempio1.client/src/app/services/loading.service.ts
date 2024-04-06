import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'

})
export class LoadingService {

  public callInProgress: number = 0;


  public updating(): void {
    console.log("+1");
    this.callInProgress++;
  }

  public updated(): void {
    console.log("-1");
    if (this.callInProgress > 0)
      this.callInProgress--;
  }
}
