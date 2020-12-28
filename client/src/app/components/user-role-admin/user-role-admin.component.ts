import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { UserRole } from './../../models/user-role';
import { MatTableDataSource } from '@angular/material/table';
import { UserRoleService } from './../../services/user-role.service';
import { Component, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-user-role-admin',
  templateUrl: './user-role-admin.component.html',
  styleUrls: ['./user-role-admin.component.css']
})
export class UserRoleAdminComponent implements OnInit {

  dataSource: MatTableDataSource<UserRole> = new MatTableDataSource<UserRole>();
  columnsToDisplay: string[] = ['id', 'name', 'permissions'];

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

  constructor(private userRoleService: UserRoleService) { }

  ngOnInit(): void {
    this.userRoleService.getAllRoles()
      .subscribe(recvRoles => this.dataSource.data = recvRoles);

    this.dataSource.filterPredicate = (data: UserRole, filter: string) => {
      const dataStr = (data.id + ' ' + data.name + ' ' + data.permissions.map(p => p.name).join(' ')).toLowerCase();
      const filters: string[] = filter.replace(/\s+/g, ' ').split(' ');
      for (const singleFilter of filters) {
        if (!dataStr.includes(singleFilter)) {
          return false;
        }
      }
      return true;
    };
  }

  applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}
