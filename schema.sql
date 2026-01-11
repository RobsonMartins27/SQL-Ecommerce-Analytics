CREATE DATABASE techstore;

USE techstore;

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
    );
    
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    status VARCHAR(2)
);

CREATE TABLE order_items (
	order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Notebook Gamer','Eletronicos'),
(2, 'Mouse Sem fio','Acessorios'),
(3, 'Teclado Mecanico','Acessorios'),
(4, 'Monitor 24','Eletronicos');

INSERT INTO orders VALUES
(101, 1, '2023-01-10', 'PAGO'),
(102, 2, '2023-01-12', 'PAGO'),
(103, 1, '2023-02-15', 'PAGO'),
(104, 3, '2023-02-20', 'PAGO'),
(105, 1, '2023-03-05', 'PAGO');

INSERT INTO order_items VALUES
(101, 1, 1, 3500.00),
(101, 2, 2, 50.00),
(102, 2, 1, 50.00),
(103, 3, 1, 200.00),
(104, 4, 1, 1200.00),
(105, 2, 5, 50.00);