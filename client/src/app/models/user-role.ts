import { UserPermission } from './user-permission';

export interface UserRole {
  id: number;
  name: string;
  permissions: UserPermission[];
}
