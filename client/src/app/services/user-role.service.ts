import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UserRole } from '../models/user-role';

@Injectable({
  providedIn: 'root'
})
export class UserRoleService {

  constructor(private http: HttpClient) { }

  getAllUserRoles(): Observable<UserRole[]> {
    return this.http.get<UserRole[]>('http://localhost:8080/users/roles');
  }
}
