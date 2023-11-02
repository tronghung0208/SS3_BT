CREATE DATABASE student_management;

USE student_management;

-- Tạo bảng thông tin khách hàng
CREATE TABLE customer
(
    customer_id   INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(45) NOT NULL,
    customer_age  INT
);

-- Tạo bảng đơn hàng

CREATE TABLE oder
(
    oder_id          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id      INT,
    oder_date        DATETIME,
    oder_total_price INT,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

-- Sản phẩm
CREATE TABLE product
(
    product_id    INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(25),
    product_price INT
);

-- Tạo bảng phụ chi tiết đơn hàng

CREATE TABLE oder_detail
(
    oder_id     INT,
    product_id  INT,
    od_quantity INT,
    PRIMARY KEY (oder_id, product_id),
    CONSTRAINT fk_oder FOREIGN KEY (oder_id) REFERENCES oder (oder_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- Thêm dữ liệu khách hàng
INSERT INTO customer(customer_name, customer_age)
VALUES ('Minh Quân', 18),
       ('Ngọc Oanh', 20),
       ('Hồng Hà', 22),
       ('Trọng Hùng', 22);

-- Thêm dữ liệu product
INSERT INTO oder(customer_id, oder_date, oder_total_price)
VALUES (1, STR_TO_DATE('2023-03-11', '%Y-%m-%d'), null),
       (2, STR_TO_DATE('2023-08-08', '%Y-%m-%d'), null),
       (3, STR_TO_DATE('2023-09-22', '%Y-%m-%d'), null),
       (1, STR_TO_DATE('2023-11-15', '%Y-%m-%d'), null);


-- Thêm dữ liệu vào bảng product
INSERT INTO product(product_name, product_price)
VALUES ('Máy giặt', 3),
       ('Tủ lạnh', 5),
       ('Điều hòa', 7),
       ('Quạt', 1),
       ('Bếp điện', 2);

INSERT INTO oder_detail
VALUES (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (4, 5, 4),
       (2, 3, 3);

/*
 SELECT
	o.ID,
    o.ORDER_DATE,
    SUM(od.ORDER_QTY * p.PRICE) AS TOTAL_PRICE
FROM ORDERS AS o
LEFT JOIN ORDER_DETAIL AS od ON o.ID = od.ORDER_ID
LEFT JOIN PRODUCT AS p ON p.ID = od.PRODUCT_ID
GROUP BY o.ID;
 */

-- Hiển thị các thông tin gồm oder_id, oder_date, product_price của tất cả các hóa đơn trong bảng Order

SELECT o.oder_id                             AS 'Mã đơn hàng',
       o.oder_date                           AS 'Ngày',
       SUM(od.od_quantity * p.product_price) AS 'Tổng giá'
FROM oder o
         LEFT JOIN oder_detail od ON o.oder_id = od.oder_id
         LEFT JOIN product p ON od.product_id = p.product_id
GROUP BY o.oder_id;

--  Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

# SELECT
#     c.ID,
#     c.NAME,
#     GROUP_CONCAT(p.NAME SEPARATOR ", ")
# FROM CUSTOMERS AS c
#          INNER JOIN ORDERS AS o ON c.ID = o.CUSTOMNER_ID
#          INNER JOIN ORDER_DETAIL AS od ON o.ID = od.ORDER_ID
#          INNER JOIN PRODUCT AS p ON od.PRODUCT_ID = p.ID
# GROUP BY c.ID;


SELECT c.customer_id   AS 'Khách mua',
       c.customer_name AS 'Tên khách',
       GROUP_CONCAT(p.product_name SEPARATOR ', ')
FROM customer c
         JOIN oder o on c.customer_id = o.customer_id
         JOIN oder_detail od on od.oder_id = o.oder_id
         JOIN product p on od.product_id = p.product_id
GROUP BY c.customer_id;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT
    c.customer_id,
    c.customer_name
FROM customer c
         LEFT JOIN oder o ON c.customer_id = o.customer_id
WHERE o.oder_id IS NULL;

-- Lấy ra các order detail bao gồm id, tên sản phẩm, số lượng và đơn giá cũng như tổng tiền
SELECT
    p.product_name,
    od.od_quantity,
    p.product_price,
    od.od_quantity * p.product_price TOTAL_PRICE
FROM oder_detail AS od
         INNER JOIN PRODUCT AS p ON od.PRODUCT_ID = p.product_id