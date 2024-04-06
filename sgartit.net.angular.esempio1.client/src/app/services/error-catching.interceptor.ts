import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { throwError } from 'rxjs/internal/observable/throwError';
import { catchError } from 'rxjs/internal/operators/catchError';
import { map } from 'rxjs/internal/operators/map';
import { ErrorService } from './error.service';
import { LoadingService } from './loading.service';

export const ErrorCatchingInterceptor: HttpInterceptorFn = (req, next) => {
  const errorService = inject(ErrorService);
  const loadingService = inject(LoadingService);

  loadingService.updating();

  return next(req)
    .pipe(
      map((res: any) => {
        if (res.status) {
          console.log("updated 1", res);
          loadingService.updated();

          //console.log("Passed through the interceptor in response");
          const errors: string[] = res?.body?.errors;
          if (errors?.length > 0) {
            for (let i = 0; i < errors.length; i++) {
              const err = errors[i];
              console.error(err);
              errorService.add(err);
            }
          }
        }
        return res
      }),
      catchError((err: any) => {
        if (err instanceof HttpErrorResponse) {
          // Handle HTTP errors
          if (err.status === 401) {
            // Specific handling for unauthorized errors         
            console.error('Unauthorized request:', err);
            // You might trigger a re-authentication flow or redirect the user here
          } else {
            // Handle other HTTP error codes
            console.error('HTTP error:', err);
          }
        } else {
          // Handle non-HTTP errors
          console.error('An error occurred:', err);
        }

        // Re-throw the error to propagate it further
        return throwError(() => err);
      })
    );;
};

//export const AuthInterceptor: HttpInterceptorFn = (req, next) => {
//  const authToken = 'YOUR_AUTH_TOKEN_HERE';

//  // Clone the request and add the authorization header
//  const authReq = req.clone({
//    setHeaders: {
//      Authorization: `Bearer ${authToken}`
//    }
//  });

//  // Pass the cloned request with the updated header to the next handler
//  return next(authReq);
//};

//import { Injectable } from '@angular/core';
//import { HttpErrorResponse, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest, HttpResponse } from '@angular/common/http';
//import { Observable, throwError } from 'rxjs';
//import { catchError, map } from "rxjs/operators";
//import { ErrorService } from './error.service';
//import { LoadingService } from './loading.service';

//@Injectable()
//export class ErrorCatchingInterceptor implements HttpInterceptor {

//  constructor(
//    private errorService: ErrorService,
//    private loadingService: LoadingService
//  ) {
//  }

//  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
//    //console.log("Passed through the interceptor in request");
//    this.loadingService.updating();

//    return next.handle(request)
//      .pipe(
//        map((res: any) => {
//          if (res.status) {
//            console.log("updated 1", res);
//            this.loadingService.updated();

//            //console.log("Passed through the interceptor in response");
//            const errors: string[] = res?.body?.errors;
//            if (errors?.length > 0) {
//              for (let i = 0; i < errors.length; i++) {
//                const err = errors[i];
//                console.error(err);
//                this.errorService.add(err);
//              }
//            }
//          }
//          return res
//        }),
//        catchError((error: HttpErrorResponse) => {
//          console.error("catchError begin");
//          this.loadingService.updated();
//          let errorMsg = '';
//          if (error.error instanceof ErrorEvent) {
//            //console.log('This is client side error');
//            errorMsg = `Error: ${error.error.message}`;
//          } else {
//            //console.log('This is server side error');
//            errorMsg = `Error Code: ${error.status},  Message: ${error.message}`;
//          }
//          this.errorService.add(errorMsg);
//          console.error("catchError end",errorMsg);

//          return throwError(errorMsg);
//        })
//      )
//  }
//}
