//import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
//import { NgModule } from '@angular/core';
//import { BrowserModule } from '@angular/platform-browser';

//import { AppComponent } from './app-root/app.component';
//import { AppRoutingModule } from './routes/routing.module';
//import { HeaderComponent } from './components/header/header.component';
//import { ShowErrorsComponent } from './components/show-errors/show-errors.component';
//import { ErrorCatchingInterceptor } from './services/error-catching.interceptor';
//import { LoadingComponent } from './components/loading/loading.component';
//import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';

//@NgModule({
//  declarations: [
//    AppComponent,
//    HeaderComponent,
//    ShowErrorsComponent,
//    LoadingComponent
//  ],
//  imports: [
//    BrowserModule,
//    HttpClientModule,
//    AppRoutingModule
//  ],
//  providers: [
//    { provide: 'API_BASE_URL', useValue: '/' },
//    {
//      provide: HTTP_INTERCEPTORS,
//      useClass: ErrorCatchingInterceptor,
//      multi: true
//    },
//    provideAnimationsAsync()
//  ],
//  bootstrap: [AppComponent]
//})
//export class AppModule { }
