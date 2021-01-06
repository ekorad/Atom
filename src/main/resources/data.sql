DELETE FROM users;
DELETE FROM roles_permissions;
DELETE FROM user_roles;
DELETE FROM user_permissions;

INSERT INTO user_permissions (name, description) VALUES
    ('CREATE_SELF_COMMENTS', 'Utilizatorul poate scrie comentarii'), 
    ('MODIFY_SELF_COMMENTS', 'Utilizatorul isi poate edita comentariile proprii'), 
    ('DELETE_SELF_COMMENTS', 'Utilizatorul isi poate sterge comentariile proprii'),
    ('PLACE_ORDER', 'Utilizatorul poate plasa comenzi'), 
    ('MODIFY_ANY_ORDER', 'Utilizatorul poate modifica orice comanda a oricarui utilizator'), 
    ('DELETE_ANY_ORDER', 'Utilizatorul poate sterge orice comanda a oricarui utilizator'), 
    ('READ_ANY_ORDER', 'Utilizatorul poate accesa orice comanda a oricarui utilizator'), 
    ('MODIFY_ANY_COMMENT', 'Utilizatorul poate modifica orice comentariu al oricarui utilizator'), 
    ('DELETE_ANY_COMMENT', 'Utilizatorul poate sterge orice comentariu al oricarui utilizator'),
    ('ADD_NEW_PRODUCT', 'Utilizatorul poate adauga noi produse in baza de date'), 
    ('MODIFY_ANY_PRODUCT', 'Utilizatorul poate modifica orice produs din baza de date'), 
    ('DELETE_ANY_PRODUCT', 'Utilizatorul poate sterge orice produs din baza de date'),
    ('CREATE_NEW_USER', 'Utilizatorul poate crea noi conturi de utilizatori'), 
    ('MODIFY_ANY_USER', 'Utilizatorul poate modifica contul oricarui utilizator'), 
    ('DELETE_ANY_USER', 'Utilizatorul poate sterge contul oricarui utilizator'), 
    ('READ_ANY_USER', 'Utilizatorul poate accesa datele contului oricarui utilizator'),
    ('READ_ANY_ROLE', 'Utilizatorul poate accesa toate rolurile de utilizator'), 
    ('READ_ANY_PERMISSION', 'Utilizatorul poate accesa toate permisiunile de utilizator');

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