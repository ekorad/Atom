import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { UserPermission } from '../models/user-permission';

@Injectable({
  providedIn: 'root'
})
export class UserPermissionService {

  constructor(private http: HttpClient) { }

  getAllUserPermissions(): Observable<UserPermission[]> {
    return this.http.get<UserPermission[]>('http://localhost:8080/users/permissions');
  }
}
