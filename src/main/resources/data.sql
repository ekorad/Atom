DELETE FROM user_permissions;

INSERT INTO user_permissions (`name`) VALUES
    ('READ'), ('WRITE'), ('MODIFY'), ('DELETE'),
    ('ELEVATED_READ'), ('ELEVATED_WRITE'), ('ELEVATED_MODIFY'), ('ELEVATED_DELETE'),
    ('DEV_READ'), ('DEV_WRITE'), ('DEV_MODIFY'), ('DEV_DELETE');