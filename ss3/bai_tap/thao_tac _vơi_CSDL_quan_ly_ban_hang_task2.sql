use quan_ly_ban_hang ;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order:
select o.id_or, o.date_or, o.total_price_or
from `order` o;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách:
select customer.name_cus, product.name_pro, `order`.id_or
from customer join `order` on customer.id_cus = `order`.id_cus join `orderdetail` on `order`.id_or = `orderdetail`.id_or 
join product on `orderdetail`.id_pro = product.id_pro;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào:
select customer.name_cus, product.name_pro, `order`.id_or,
`orderdetail`.qty_odd from customer join `order` on customer.id_cus = `order`.id_cus join `orderdetail` on `order`.id_or = `orderdetail`.id_or 
join product on `orderdetail`.id_pro = product.id_pro
where `orderdetail`.qty_odd is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice):
select `orderdetail`.id_or, `order`.date_or, sum(`orderdetail`.qty_odd * product.price_pro) as "total"
from customer join `order` on customer.id_cus = `order`.id_cus join `orderdetail` on `orderdetail`.id_or = `order`.id_or
join product on product.id_pro = `orderdetail`.id_pro
group by `orderdetail`.id_or;