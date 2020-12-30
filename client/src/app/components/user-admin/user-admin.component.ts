import { UserRole } from './../../models/user-role';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { User } from './../../models/user';
import { MatTableDataSource } from '@angular/material/table';
import { UserService } from './../../services/user.service';
import { Component, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-user-admin',
  templateUrl: './user-admin.component.html',
  styleUrls: ['./user-admin.component.css']
})
export class UserAdminComponent implements OnInit {

  dataSource: MatTableDataSource<User> = new MatTableDataSource<User>();
  columnsToDisplay: string[] = ['id', 'username', 'firstName', 'lastName', 'email', 'password', 'locked', 'activated', 'role'];

  @ViewChild(MatSort, { static: false }) set sort(val: MatSort) {
    if (val) {
      this.dataSource.sort = val;
    }
  }

  @ViewChild(MatPaginator, { static: false }) set paginator(val: MatPaginator) {
    if (val) {
      this.dataSource.paginator = val;
    }
  }

  constructor(private userService: UserService) { }

  ngOnInit(): void {
    this.userService.getAllUsers()
      .subscribe(recvUsers => this.dataSource.data = recvUsers);
  }

  applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}
