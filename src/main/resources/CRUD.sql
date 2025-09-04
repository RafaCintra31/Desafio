CREATE TABLE usuarios(
    id      BIGINT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(255)    NOT NULL                           ,
    age     INT             NOT NULL                           ,
    score   INT             NOT NULL                           ,
    active  BOOLEAN         NOT NULL DEFAULT false             ,
    country VARCHAR(255)    NOT NULL                           ,
    team    VARCHAR(255)    NOT NULL
);

CREATE TABLE team(
    id          BIGINT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255)    NOT NULL                           ,
    leader      BOOLEAN         NOT NULL DEFAULT false             ,
    projects    VARCHAR(255)    NOT NULL                           ,
    id_usuario  BIGINT          NOT NULL                           ,
    CONSTRAINT fk_team_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE projects(
    id          BIGINT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255)    NOT NULL                           ,
    completed   BOOLEAN         NOT NULL DEFAULT false             ,
    id_team     BIGINT          NOT NULL                           ,
    CONSTRAINT fk_projects_team FOREIGN KEY (id_team) REFERENCES team (id)
);

CREATE TABLE logs (
    id          BIGINT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date        DATE            NOT NULL                           ,
    action      VARCHAR(255)    NOT NULL                           ,
    id_usuario  BIGINT          NOT NULL                           ,
    CONSTRAINT fk_logs_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);