import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { PartialObserver } from 'rxjs';
import { UserRole } from './../../models/user-role';
import { LoaderService } from './../../services/loader.service';
import { UserRoleService } from './../../services/user-role.service';

@Component({
  selector: 'app-user-role-admin',
  templateUrl: './user-role-admin.component.html',
  styleUrls: ['./user-role-admin.component.css']
})
export class UserRoleAdminComponent implements OnInit {

  private readonly initialObserver: PartialObserver<UserRole[]> = {
    next: recvRoles => this.dataSource.data = recvRoles
  };

  private readonly refreshObserver: PartialObserver<UserRole[]> = {
    next: recvRoles => this.dataSource.data = recvRoles,
    complete: () => this.snackBar.open('Datele au fost incarcate cu succes',
      'Inchide', { duration: 3000 })
  };

  isLoading = false;
  dataSource: MatTableDataSource<UserRole> = new MatTableDataSource<UserRole>();
  columnsToDisplay: string[] = ['id', 'name', 'permissions', 'description'];

  @ViewChild(MatPaginator, { static: false }) paginator!: MatPaginator;
  @ViewChild(MatSort, { static: false }) sort!: MatSort;

  constructor(private userRoleService: UserRoleService,
              private loaderService: LoaderService,
              private cd: ChangeDetectorRef, private snackBar: MatSnackBar) { }

  ngOnInit(): void {
    this.loaderService.isLoading$
      .subscribe(val => {
        this.isLoading = val;
        this.cd.detectChanges();
        this.dataSource.filter = '';
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      });

    this.userRoleService.getAllUserRoles()
      .subscribe(this.initialObserver);

    this.dataSource.filterPredicate = (data: UserRole, filter: string) => {
      const permissionsStr = data.permissions.map(perm => perm.name).join(' ');
      let dataStr = (data.id + ' ' + data.name + ' ' + permissionsStr
        + ' ' + data.description).toLowerCase();
      const filters: string[] = filter.replace(/\s+/g, ' ').split(' ');
      for (const singleFilter of filters) {
        if (!dataStr.includes(singleFilter)) {
          return false;
        } else {
          dataStr = dataStr.replace(singleFilter, '');
        }
      }
      return true;
    };
  }

  onClick(): void {
    this.refreshContent();
  }

  applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase().replace(/\s+/g, ' ');
  }

  private refreshContent(): void {
    this.userRoleService.getAllUserRoles()
      .subscribe(this.refreshObserver);
  }

}
