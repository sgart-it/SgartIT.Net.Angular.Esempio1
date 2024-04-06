import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable';
import { ResponseData } from '../models/response-base';
import { AppUser } from '../models/app-user';
import { take, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {
  private apiUrl: string;
  constructor(
    private http: HttpClient,
    @Inject('API_BASE_URL') baseUrl: string
  ) {
    this.apiUrl = baseUrl + "api/user";
  }

  public currentUser: AppUser = {
    userId: '',
    displayName: '',
    loginName: ''
  };

  public init(): Observable<void> {
    return this.http.get<ResponseData<AppUser>>(this.apiUrl + "/current")
      .pipe(
        take(1),
        tap((response: any) => {
          console.log("user", response);
          return null;
        })
      );
  }

}
