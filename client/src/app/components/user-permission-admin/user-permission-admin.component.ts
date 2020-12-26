import { AfterViewInit, Component, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort, MatSortable } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { UserPermission } from './../../models/user-permission';
import { UserPermissionService } from './../../services/user-permission.service';

@Component({
  selector: 'app-user-permission-admin',
  templateUrl: './user-permission-admin.component.html',
  styleUrls: ['./user-permission-admin.component.css']
})
export class UserPermissionAdminComponent implements AfterViewInit {

  dataSource: MatTableDataSource<UserPermission> = new MatTableDataSource<UserPermission>();
  columnsToDisplay: string[] = ['id', 'name'];

  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private userPermService: UserPermissionService) {
  }

  ngAfterViewInit(): void {
    this.userPermService.getAllUserPermissions()
      .subscribe(recvPerms => {
        this.dataSource.data = recvPerms;
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      });
  }

  applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}
