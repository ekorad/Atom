DELETE FROM users;
DELETE FROM roles_permissions;
DELETE FROM user_roles;
DELETE FROM user_permissions;

INSERT INTO user_permissions (name) VALUES
    ('CREATE_SELF_COMMENTS'), ('MODIFY_SELF_COMMENTS'), ('DELETE_SELF_COMMENTS'),
    ('PLACE_ORDER'), ('MODIFY_ANY_ORDER'), ('DELETE_ANY_ORDER'), ('READ_ANY_ORDER'), 
    ('MODIFY_ANY_COMMENT'), ('DELETE_ANY_COMMENT'),
    ('ADD_NEW_PRODUCT'), ('MODIFY_ANY_PRODUCT'), ('DELETE_ANY_PRODUCT'),
    ('CREATE_NEW_USER'), ('MODIFY_ANY_USER'), ('DELETE_ANY_USER'), ('READ_ANY_USER'),
    ('READ_ANY_ROLE'), ('READ_ANY_PERMISSION');

INSERT INTO user_roles (name) VALUES
    ('USER'), ('MODERATOR'), ('ADMIN');

INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'USER' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'CREATE_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'USER' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'USER' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'USER' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'PLACE_ORDER' LIMIT 1));

INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'CREATE_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'PLACE_ORDER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_ANY_COMMENT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_ANY_COMMENT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'MODERATOR' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'READ_ANY_ORDER' LIMIT 1));

INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'CREATE_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_SELF_COMMENTS' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'PLACE_ORDER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_ANY_COMMENT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_ANY_COMMENT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'READ_ANY_ORDER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_ANY_ORDER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_ANY_ORDER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'ADD_NEW_PRODUCT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_ANY_PRODUCT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_ANY_PRODUCT' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'CREATE_NEW_USER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'DELETE_ANY_USER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'MODIFY_ANY_USER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'READ_ANY_USER' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'READ_ANY_ROLE' LIMIT 1));
INSERT INTO roles_permissions(role_id, permission_id) VALUES 
    ((SELECT id FROM user_roles WHERE name = 'ADMIN' LIMIT 1), 
        (SELECT id FROM user_permissions WHERE name = 'READ_ANY_PERMISSION' LIMIT 1));

INSERT INTO users(first_name, last_name, username, email, `password`, locked, activated, role) VALUES
    ('Vlad-Gabriel', 'Zahiu', 'ekorad', 'vladzahiu28@gmail.com', 
    '$2y$10$j/FGrZnTDRBevLv5DaImKu1cyl9KqyQiiA.v/8SQFmupituZ.WbGW', false, true,
        (SELECT id FROM user_roles WHERE name = 'ADMIN'));
INSERT INTO users(first_name, last_name, username, email, `password`, locked, activated, role) VALUES
    ('Gogu', 'Leustean', 'goguleustean', 'gogu.leustean@gmail.com', 
    '$2y$10$LKJJTBYRqIzcfDlYDRIB9uGknnr5eu99y6rTZSEfcVu8ggRfV02rC', false, false,
        (SELECT id FROM user_roles WHERE name = 'USER'));