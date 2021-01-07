import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ErrorDialogComponent } from './components/error-dialog/error-dialog.component';
import { UserAdminComponent } from './components/user-admin/user-admin.component';
import { UserPermissionAdminComponent } from './components/user-permission-admin/user-permission-admin.component';
import { UserRoleAdminComponent } from './components/user-role-admin/user-role-admin.component';
import { ErrorInterceptor } from './interceptors/error.interceptor';
import { LoaderInterceptor } from './interceptors/loader.interceptor';
import { MatExporterModule } from './modules/mat-exporter/mat-exporter.module';

@NgModule({
  declarations: [
    AppComponent,
    UserPermissionAdminComponent,
    UserRoleAdminComponent,
    UserAdminComponent,
    ErrorDialogComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MatExporterModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: LoaderInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
