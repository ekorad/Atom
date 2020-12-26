import { SelectionModel } from '@angular/cdk/collections';
import { Component, OnInit } from '@angular/core';
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
  displayedColumns: string[] = ['select', 'id', 'name'];
  selection = new SelectionModel<UserPermission>(true, []);

  isAllSelected(): boolean {
    const numSelected = this.selection.selected.length;
    const numRows = this.dataSource.data.length;
    return numSelected === numRows;
  }

  masterToggle(): void {
    this.isAllSelected() ? this.selection.clear()
      : this.dataSource.data.forEach(row => this.selection.select(row));
  }

  checkboxLabel(row?: UserPermission): string {
    if (!row) {
      return `${this.isAllSelected() ? 'select' : 'deselect'}`;
    }
    return `${this.selection.isSelected(row) ? 'deselect' : 'select'}`;
  }

  constructor(private userPermService: UserPermissionService) { }

  ngOnInit(): void {
    this.userPermService.getAllUserPermissions()
      .subscribe(recvPerms => this.dataSource.data = recvPerms);
  }

}
