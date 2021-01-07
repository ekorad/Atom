import { MatSnackBar } from '@angular/material/snack-bar';
import { LoaderService } from './../../services/loader.service';
import { PartialObserver } from 'rxjs';
import { Component, OnInit, ViewChild, ChangeDetectorRef } from '@angular/core';
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

  private readonly initialObserver: PartialObserver<UserPermission[]> = {
    next: recvPerms => this.dataSource.data = recvPerms
  };

  private readonly refreshObserver: PartialObserver<UserPermission[]> = {
    next: recvPerms => this.dataSource.data = recvPerms,
    complete: () => this.snackBar.open('Datele au fost incarcate cu succes',
      'Inchide', { duration: 3000 })
  };

  isLoading = false;
  dataSource: MatTableDataSource<UserPermission> = new MatTableDataSource<UserPermission>();
  columnsToBeDisplayed = ['id', 'name', 'description'];

  @ViewChild(MatPaginator, { static: false }) paginator!: MatPaginator;
  @ViewChild(MatSort, { static: false }) sort!: MatSort;

  constructor(private userPermissionService: UserPermissionService,
              private loaderService: LoaderService, private cd: ChangeDetectorRef,
              private snackBar: MatSnackBar) { }

  ngOnInit(): void {
    this.loaderService.isLoading$
      .subscribe(val => {
        this.isLoading = val;
        this.cd.detectChanges();
        this.dataSource.filter = '';
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      });
    this.userPermissionService.getAllUserPermissions()
      .subscribe(this.initialObserver);

    this.dataSource.filterPredicate = (data: UserPermission, filter: string) => {
      let dataStr = (data.id + ' ' + data.name + ' ' + data.description).toLowerCase();
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
    this.userPermissionService.getAllUserPermissions()
      .subscribe(this.refreshObserver);
  }

}
