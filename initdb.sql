-- Datenbank einrichten
CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username text NOT NULL,
    UNIQUE(username)
);
CREATE TABLE IF NOT EXISTS state (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text NOT NULL,
    description text,
    UNIQUE(name)
);
CREATE TABLE IF NOT EXISTS request (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created datetime default current_timestamp,
    user INTEGER NOT NULL,
    state INTEGER NOT NULL,
    FOREIGN KEY(user) REFERENCES user(id),
    FOREIGN KEY(state) REFERENCES state(id)
);
CREATE TABLE IF NOT EXISTS note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    request INTEGER NOT NULL,
    note text NOT NULL,
    created datetime default current_timestamp,
    FOREIGN KEY(request) REFERENCES request(id)
);
CREATE TABLE IF NOT EXISTS server (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fqdn text NOT NULL,
    UNIQUE(fqdn)
);
CREATE TABLE IF NOT EXISTS request_server (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    request INTEGER NOT NULL,
    server INTEGER NOT NULL,
    FOREIGN KEY(request) REFERENCES request(id),
    FOREIGN KEY(server) REFERENCES server(id),
    UNIQUE(request, server)
);
