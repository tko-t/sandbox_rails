CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'password';
GRANT SELECT, PROCESS ON *.* TO 'readonly_user'@'%';
