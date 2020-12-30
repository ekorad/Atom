import { UserRole } from './user-role';
export interface User {
  id: number;
  firstName: string;
  lastName: string;
  username: string;
  email: string;
  password: string;
  locked: boolean;
  activated: boolean;
  role: UserRole;
}
