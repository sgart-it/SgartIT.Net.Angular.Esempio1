import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app-root/app.component';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { HTTP_INTERCEPTORS, HttpClient, withInterceptors } from '@angular/common/http';
import { ErrorCatchingInterceptor } from './app/services/error-catching.interceptor';
import { provideRouter } from '@angular/router';
import { APP_ROUTES } from './app/routes/routes';
import { provideHttpClient } from "@angular/common/http";
import { Observable } from 'rxjs/internal/Observable';
import { APP_INITIALIZER } from '@angular/core';
import { APP_CONFIG, AppConfig } from './app/models/app-config';
import { take, tap } from 'rxjs/operators';

const MY_APP_CONFIG: AppConfig = {
  version: '',
  appTitle: '',
  currentUser: {
    userId: '',
    displayName: '',
    loginName: ''
  },
};

export function initializeApplication(http: HttpClient) {
  console.log("initializeApplication");
  return (): Observable<void> => http
    .get('/api/config')
    .pipe(
      take(1),
      tap((response: any) => {
        console.log("initializeApplication response", response);
        Object.assign(MY_APP_CONFIG, {
          ...response.data
        })
      })
    );
}


bootstrapApplication(AppComponent, {
  providers: [
    { provide: 'API_BASE_URL', useValue: '/' },
    provideHttpClient(withInterceptors([ErrorCatchingInterceptor])),
    //{
    //  provide: HTTP_INTERCEPTORS,
    //  useClass: ErrorCatchingInterceptor,
    //  multi: true
    //},
    provideRouter(APP_ROUTES),
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApplication,
      multi: true,
      deps: [HttpClient]
    },
    { provide: APP_CONFIG, useValue: MY_APP_CONFIG },
    provideAnimationsAsync()
  ]
})
  .catch(err => console.error(err));
