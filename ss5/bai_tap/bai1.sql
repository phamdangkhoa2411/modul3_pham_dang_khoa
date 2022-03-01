drop database demo ;
create database demo;
use demo;

create table products(
id_product int primary key,
product_code int,
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45)
);
insert into products 
values 
(1,100, "dien thoai", 70.0, 10, "sản xuất tại Việt Nam", "xuất khẩu"),
(2,101, "may mặc", 50.0, 20, "sản xuất tại Việt Nam", "xuất khảu"),
(3,102, "trái cây", 40.0, 30, "sản xuất tại Việt Nam", "xuất khẩu"),
(4,103, "điện tử", 60.0, 40, "sản xuất tại Nhật bản", "nhập khẩu"),
(5,104, "thịt bò", 70.0, 90, "sản xuất tại Australia", "nhập khẩu");
select * from products;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index products_index
on products (product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index product_name_price
on products(product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào:
Explain select * from products where product_name = "may mặc";
-- So sánh câu truy vấn trước và sau khi tạo index:
drop index product_name_price on products;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW products_view AS
    SELECT 
        products.product_code,
        products.product_name,
        products.product_price,
        products.product_status
 from products;       
select * from products_view;
-- Tiến hành sửa đổi view:
create or replace view products_view as select
		product_code, 
        product_name, 
        product_price,
        product_status
from products;
-- Tiến hành xoá view
drop view products_view;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure find_all_products() 
begin
select * from products;
end//
DELIMITER ;
call find_all_products(); 
-- Tạo store procedure thêm một sản phẩm mới:
DELIMITER //
create procedure new_products(
id_product int,
product_code int,
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45))
begin
insert into new_products value 
(id_product, product_code, product_name, product_price, product_amount, product_description, product_status);
end;
//DELIMITER ;
-- Tạo store procedure sửa thông tin sản phẩm theo id:
DELIMITER //
create procedure edit_product (id_product int ,
product_code int,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status varchar(50))
begin
update products
set
product_code = product_code,
product_name = product_name,
product_price = product_price,
product_amount = product_amount,
product_description = product_description,
product_status = product_status
WHERE products.id_product = id_product;
END; //
DELIMITER ;
CALL edit_product(6, 104, "sữa", 40.0, 6,"sản xuất tại Hà Lan", "nhập khẩu");
--  Tạo store procedure xoá sản phẩm theo id
--  DELIMITER //
--  CREATE PROCEDURE delete_product (id INT)
--  BEGIN 
-- DELETE 
--  FROM products
--  WHERE  products.id=id;
-- END; //
-- DELIMITER ;

-- CALL delete_product(4);
        


