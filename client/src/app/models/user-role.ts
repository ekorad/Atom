import { UserPermission } from './user-permission';

export interface UserRole {
  [propName: string]: number | string | UserPermission[];
  id: number;
  name: string;
  description: string;
  permissions: UserPermission[];
}
