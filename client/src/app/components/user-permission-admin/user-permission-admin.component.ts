import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { UserPermission } from './../../models/user-permission';
import { UserPermissionService } from './../../services/user-permission.service';

@Component({
  selector: 'app-user-permission-admin',
  templateUrl: './user-permission-admin.component.html',
  styleUrls: ['./user-permission-admin.component.css']
})
export class UserPermissionAdminComponent implements OnInit {

  dataSource: MatTableDataSource<UserPermission> = new MatTableDataSource<UserPermission>();
  columnsToDisplay: string[] = ['id', 'name'];

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

  constructor(private userPermService: UserPermissionService) {
  }

  ngOnInit(): void {
    this.userPermService.getAllUserPermissions()
      .subscribe(recvPerms => this.dataSource.data = recvPerms);
  }

  applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}
