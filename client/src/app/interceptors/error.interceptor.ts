import { ErrorDialogComponent } from './../components/error-dialog/error-dialog.component';
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, ObservableInput, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { MatDialog } from '@angular/material/dialog';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {

  constructor(private dialog: MatDialog) { }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    return next.handle(request)
      .pipe(
        catchError((error: HttpErrorResponse): ObservableInput<any> => {
          let errMsg = '';
          if (error.error instanceof ErrorEvent) {
            errMsg = `${error.error.message}`;
          } else {
            errMsg = `(code: ${error.status}): ${error.message}`;
          }
          this.dialog.open(ErrorDialogComponent, {
            data: { errorMessage: errMsg }
          });
          return throwError(error);
        })
      );
  }
}
