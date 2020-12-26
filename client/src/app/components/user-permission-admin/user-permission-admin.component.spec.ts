import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserPermissionAdminComponent } from './user-permission-admin.component';

describe('UserPermissionAdminComponent', () => {
  let component: UserPermissionAdminComponent;
  let fixture: ComponentFixture<UserPermissionAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserPermissionAdminComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserPermissionAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
