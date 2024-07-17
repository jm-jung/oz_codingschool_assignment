-- (1) **`customers`** 테이블에 새 고객을 추가하세요.
-- INSERT INTO Customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) VALUES
-- (1001, 'Atelier graphique', 'Schmitt', 'Carine', '40.32.2555', '54, rue Royale', NULL, 'Nantes', NULL, '44000', 'France', 1370, 21000.00)

-- (2) **`products`** 테이블에 새 제품을 추가하세요.
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) VALUES
-- ('S12_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever.', 7933, 48.81, 95.70)

-- (3) **`employees`** 테이블에 새 직원을 추가하세요.
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) VALUES
-- (1100, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', NULL, 'President');

-- (4) **`offices`** 테이블에 새 사무실을 추가하세요.
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) VALUES
-- ('100', 'San Francisco', '+1 650 219 4782', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'NA');


-- (5) **`orders`** 테이블에 새 주문을 추가하세요.
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber) VALUES
-- (11000, '2024-07-18', '2024-07-25', '2024-07-20', 'Shipped', 'Order shipped on time', 1001);

-- (6) **`orderdetails`** 테이블에 주문 상세 정보를 추가하세요.
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) VALUES
-- (11000, 'S10_1678', 30, 95.70, 1);

-- (7) **`payments`** 테이블에 지불 정보를 추가하세요.
-- INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) VALUES
-- (1001, 'HQ336338', '2024-07-15', 5000.00);

-- (8) **`productlines`** 테이블에 제품 라인을 추가하세요.
-- INSERT INTO productlines (productLine, textDescription, htmlDescription, image) VALUES
-- ('Classic boat', 'High-quality replicas of classic cars', '<p>High-quality replicas of <strong>classic cars</strong>.</p>', NULL);


-- (9) **`customers`** 테이블에 다른 지역의 고객을 추가하세요.
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) VALUES
-- (1006, 'Tokyo Collectors', 'Yamamoto', 'Hiroshi', '+81 3-1234-5678', '2-2-8 Roppongi', 'Minato-ku', 'Tokyo', NULL, '106-0032', 'Japan', 1621, 150000.00);


-- (10) **`products`** 테이블에 다른 카테고리의 제품을 추가하세요.
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) VALUES
-- ('S19_3232', '1992 Ferrari 360 Spider red', 'Classic Cars', '1:18', 'Unimax Art Galleries', 'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 8347, 77.90, 169.34)

-- **`customers`** 테이블에서 모든 고객 정보를 조회하세요.
-- select * from customers;
-- (2) **`products`** 테이블에서 모든 제품 목록을 조회하세요.
-- select*from products;
-- (3) **`employees`** 테이블에서 모든 직원의 이름과 직급을 조회하세요.
-- select lastname,firstname,jobtitle from employees;
-- (4) **`offices`** 테이블에서 모든 사무실의 위치를 조회하세요.
-- select addressline1 from offices;
-- (5) **`orders`** 테이블에서 최근 10개의 주문을 조회하세요.
-- select orderdate from orders order by orderdate desc limit 10
-- (6) **`orderdetails`** 테이블에서 특정 주문의 모든 상세 정보를 조회하세요.
-- select * from orderdetails where ordernumber=30
-- (7) **`payments`** 테이블에서 특정 고객의 모든 지불 정보를 조회하세요.
-- select *from payments where customernumber=1001;
-- (8) **`productlines`** 테이블에서 각 제품 라인의 설명을 조회하세요.
-- select textdescription from productlines;
-- (9) **`customers`** 테이블에서 특정 지역의 고객을 조회하세요.
-- select * from customers where state='tokyo';
-- (10) **`products`** 테이블에서 특정 가격 범위의 제품을 조회하세요.
-- select*from products where buyprice between 10 and 30;

-- (1) **`customers`** 테이블에서 특정 고객의 주소를 갱신하세요.
-- UPDATE customers SET addressLine1 = 'New Address Line 1', city = 'New City', postalCode = 'New Postal Code' WHERE customerNumber = 1001;

-- -- (2) **`products`** 테이블에서 특정 제품의 가격을 갱신하세요.
-- UPDATE products SET buyPrice = 99.99 WHERE productCode = 'S10_1678';

-- -- (3) **`employees`** 테이블에서 특정 직원의 직급을 갱신하세요.
-- UPDATE employees SET jobTitle = 'Senior Manager' WHERE employeeNumber = 1002;

-- -- (4) **`offices`** 테이블에서 특정 사무실의 전화번호를 갱신하세요.
-- UPDATE offices SET phone = '+1 555 123 4567' WHERE officeCode = '1';

-- -- (5) **`orders`** 테이블에서 특정 주문의 상태를 갱신하세요.
-- UPDATE orders SET status = 'Cancelled' WHERE orderNumber = 10100;

-- -- (6) **`orderdetails`** 테이블에서 특정 주문 상세의 수량을 갱신하세요.
-- UPDATE orderdetails SET quantityOrdered = 40 WHERE orderNumber = 10100 AND productCode = 'S10_1678';

-- -- (7) **`payments`** 테이블에서 특정 지불의 금액을 갱신하세요.
-- UPDATE payments SET amount = 6000.00 WHERE customerNumber = 1001 AND checkNumber = 'HQ336338';

-- -- (8) **`productlines`** 테이블에서 특정 제품 라인의 설명을 갱신하세요.
-- UPDATE productlines SET textDescription = 'Updated description' WHERE productLine = 'Classic Cars';

-- -- (9) **`customers`** 테이블에서 특정 고객의 이메일을 갱신하세요
-- UPDATE customers SET email = 'newemail@example.com' WHERE customerNumber = 1001; (이메일이 없음)

-- (1) **`customers`** 테이블에서 특정 고객을 삭제하세요.
-- DELETE FROM customers WHERE customerNumber = 1001;

-- (2) **`products`** 테이블에서 특정 제품을 삭제하세요.
-- DELETE FROM products WHERE productCode = 'S10_1678';

-- (3) **`employees`** 테이블에서 특정 직원을 삭제하세요.
-- DELETE FROM employees WHERE employeeNumber = 1002;

-- (4) **`offices`** 테이블에서 특정 사무실을 삭제하세요.
-- DELETE FROM offices WHERE officeCode = '1';

-- (5) **`orders`** 테이블에서 특정 주문을 삭제하세요.
-- DELETE FROM orders WHERE orderNumber = 10100;

-- (6) **`orderdetails`** 테이블에서 특정 주문 상세를 삭제하세요.
-- DELETE FROM orderdetails WHERE orderNumber = 10100 AND productCode = 'S10_1678';

-- (7) **`payments`** 테이블에서 특정 지불 내역을 삭제하세요.
-- DELETE FROM payments WHERE customerNumber = 1001 AND checkNumber = 'HQ336338';

-- (8) **`productlines`** 테이블에서 특정 제품 라인을 삭제하세요.
-- DELETE FROM productlines WHERE productLine = 'Classic Cars';

-- (9) **`customers`** 테이블에서 특정 지역의 모든 고객을 삭제하세요.
-- DELETE FROM customers WHERE  country= 'North America';

-- (10) **`products`** 테이블에서 특정 카테고리의 모든 제품을 삭제하세요.
-- DELETE FROM products WHERE productLine = 'Classic Cars';

