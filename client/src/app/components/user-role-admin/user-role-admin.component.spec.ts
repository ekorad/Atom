import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserRoleAdminComponent } from './user-role-admin.component';

describe('UserRoleAdminComponent', () => {
  let component: UserRoleAdminComponent;
  let fixture: ComponentFixture<UserRoleAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserRoleAdminComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserRoleAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
