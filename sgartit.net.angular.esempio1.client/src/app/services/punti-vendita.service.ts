import { Inject, Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable';
//import { catchError } from 'rxjs/operators';
//import { throwError } from 'rxjs/internal/observable/throwError';
import { PuntoVendita } from '../models/punto-vendita';
import { PuntoVenditaUpdate } from '../models/punto-vendita-update';
import { PuntoVenditaDettaglio } from '../models/punto-vendita-dettaglio';
import { ResponseBase, ResponseData, ResponseList } from '../models/response-base';

@Injectable({
  providedIn: 'root'

})
export class PuntiVenditaService {
  private apiUrl: string;
  constructor(
    private http: HttpClient,
    @Inject('API_BASE_URL') baseUrl: string
  ) {
    this.apiUrl = baseUrl + "api/puntivendita";
  }

  /*intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    return next.handle(req).pipe(
      catchError((error) => {
        console.log('error is intercept')
        console.error(error);
        throwError(() => new Error(error.message))
      })
    )
  }*/


  public list(text: string): Observable<ResponseList<PuntoVendita>> {
    const params = {
      text: text
    };
    return this.http.get<ResponseList<PuntoVendita>>(this.apiUrl, { params });
  }

  public detail(puntoVenditaId: number): Observable<ResponseData<PuntoVenditaDettaglio>> {
    return this.http.get<ResponseData<PuntoVenditaDettaglio>>(this.apiUrl + '/' + puntoVenditaId);
  }

  public save(puntoVenditaId: number, data: PuntoVenditaUpdate): Observable<ResponseBase> {
    return this.http.put<ResponseBase>(this.apiUrl + '/' + puntoVenditaId, data);
  }

}
