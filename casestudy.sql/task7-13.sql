use casestudy;
 
 -- task 7
 select 
 dich_vu.ma_dich_vu,
 dich_vu.ten_dich_vu,
 dich_vu.dien_tich,
 dich_vu.so_nguoi_toi_da,
 dich_vu.chi_phi_thue,
 loai_dich_vu.ten_loai_dich_vu
 from dich_vu
 join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 join hop_dong on hop_dong.ma_dich_vu= dich_vu.ma_dich_vu 
where (hop_dong.ngay_lam_hop_dong between '2020-1-1 00:00:00%' and '2020-12-31 23:59:59%')
and (hop_dong.ngay_lam_hop_dong not between '2021-1-1 00:00:00' and '2021-12-31 23:59:59')
group by dich_vu.ma_dich_vu;

-- task 8

-- cách 1
select 
khach_hang.ho_ten 
from khach_hang
group by ho_ten;
--  cach 2
select distinct khach_hang.ho_ten from khach_hang;
-- cach 3 
select  khach_hang.ho_ten from khach_hang
union 
select  khach_hang.ho_ten from khach_hang;
-- task 9
select 
month(ngay_lam_hop_dong) thang,
count(month(ngay_lam_hop_dong)) so_luong_khach_hang
from
	hop_dong
    where year(ngay_lam_hop_dong)= 2021
    group by month(ngay_lam_hop_dong)
    order by month(ngay_lam_hop_dong) asc ;
-- task 10
select 
hop_dong.ma_hop_dong,
ngay_lam_hop_dong,
ngay_ket_thuc,
tien_dat_coc,
sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem
from
 hop_dong
 left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 group by ma_hop_dong;
 -- task11 
 SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem
FROM
    dich_vu_di_kem AS dvdk
        JOIN
    hop_dong_chi_tiet AS hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong AS hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    khach_hang AS kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach AS lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    (lk.ten_loai_khach = 'Diamond')
        AND (kh.dia_chi LIKE '%Vinh'
        OR kh.dia_chi LIKE '%Quảng Ngãi');
-- task 12 
 select
  hop_dong.ma_hop_dong,
  nhan_vien.ho_ten,
  khach_hang.ho_ten,
  khach_hang.so_dien_thoai,
  dich_vu.ten_dich_vu,
  dich_vu.ma_dich_vu,
  sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem,
  hop_dong.tien_dat_coc
  from 
	khach_hang 
    join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
    join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
    join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
    left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
    where 
    hop_dong.ma_hop_dong in 
    (select ma_hop_dong from hop_dong 
    where (month(ngay_lam_hop_dong)between 10 and 12 )
			and year(ngay_lam_hop_dong)=2020)
	and hop_dong.ma_hop_dong not in 
    (select ma_hop_dong from hop_dong 
    where (month(ngay_lam_hop_dong)between 1 and 6 )
			and year(ngay_lam_hop_dong)=2021)
group by ma_hop_dong ;
-- task 13 
select 
 dich_vu_di_kem.ma_dich_vu_di_kem ,
dich_vu_di_kem.ten_dich_vu_di_kem ,
sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem >= all(select so_luong 
from hop_dong_chi_tiet);

 


