use casestudy ;
-- task 2 
select nhan_vien. * from casestudy.nhan_vien 
where ( nhan_vien.ho_ten  like "h%" or ho_ten like "k%" or ho_ten like "t%" )
and (char_length(ho_ten )<15 );
-- task 3
select khach_hang.* from casestudy.khach_hang
where (year(current_timestamp)- year(ngay_sinh)) between 18 and 50
and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị") ;
-- task 4 
select hop_dong.ma_khach_hang,khach_hang.ho_ten, count(ma_hop_dong) as so_lan_dat_phong 
from  hop_dong 
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach like "Diamond"
group by hop_dong.ma_khach_hang
order by (ma_hop_dong) asc ;
-- task 5 
select khach_hang.ma_khach_hang,
khach_hang.ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
if (hop_dong_chi_tiet.so_luong is null, dich_vu.chi_phi_thue, 
sum(dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia))) AS "số tiền"
from khach_hang
LEFT JOIN loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu =  dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong
ORDER BY  khach_hang.ma_khach_hang , hop_dong.ma_hop_dong DESC ;
-- task 6
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where  dich_vu.ten_dich_vu
not in(select dich_vu.ten_dich_vu
from dich_vu join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where  hop_dong.ngay_lam_hop_dong
between "2021/01/01" and"2021/03/31")
group by ma_dich_vu order by chi_phi_thue desc; 