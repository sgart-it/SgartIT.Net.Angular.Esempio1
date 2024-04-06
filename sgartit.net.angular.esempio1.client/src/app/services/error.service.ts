import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'

})
export class ErrorService {
  constructor() { }

  public errors: string[] = [];


  public add(text: string): void {
    this.errors.push(text);
  }

  public clear(index: number): void {
    this.errors.splice(index, 1);
  }

  public clearAll(): void {
    this.errors.length = 0;
  }
}
