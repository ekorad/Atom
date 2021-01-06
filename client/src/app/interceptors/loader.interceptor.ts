import { LoaderService } from './../services/loader.service';
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpResponse
} from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class LoaderInterceptor implements HttpInterceptor {
  private requests: HttpRequest<unknown>[] = [];

  constructor(private loaderService: LoaderService) { }

  private removeRequest(request: HttpRequest<unknown>): void {
    const index = this.requests.indexOf(request);
    if (index >= 0) {
      this.requests.splice(index, 1);
    }
    this.loaderService.isLoading$.next(this.requests.length > 0);
  }

  private pushRequest(request: HttpRequest<unknown>): void {
    this.requests.push(request);
    this.loaderService.isLoading$.next(true);
  }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    this.pushRequest(request);
    return new Observable<HttpEvent<unknown>>(subscriber => {
      const subscription = next.handle(request)
        .subscribe(evnt => {
          if (evnt instanceof HttpResponse) {
            this.removeRequest(request);
            subscriber.next(evnt);
          }
        },
          err => {
            this.removeRequest(request);
            subscriber.error(err);
          },
          () => {
            this.removeRequest(request);
            subscriber.complete();
          });

      return () => {
        this.removeRequest(request);
        subscription.unsubscribe();
      };
    });
  }
}
