-- Crear la tabla "users"
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar 5 registros de prueba
INSERT INTO users (name, email, age) VALUES 
    ('Alice Johnson', 'alice@example.com', 28),
    ('Bob Smith', 'bob@example.com', 34),
    ('Charlie Brown', 'charlie@example.com', 25),
    ('Diana Prince', 'diana@example.com', 30),
    ('Edward Stark', 'edward@example.com', 40);
