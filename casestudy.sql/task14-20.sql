use casestudy;
-- task 14
select 
hop_dong.ma_hop_dong,
loai_dich_vu.ten_loai_dich_vu,
dich_vu_di_kem.ten_dich_vu_di_kem,
count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong
inner join hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
inner join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu=loai_dich_vu.ma_loai_dich_vu
inner join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by ten_dich_vu_di_kem 
having count(dich_vu_di_kem.ma_dich_vu_di_kem) = 1
order by ma_hop_dong;
-- task 15 
select 
nhan_vien.ma_nhan_vien,
nhan_vien.ho_ten,
trinh_do.ten_trinh_do,
bo_phan.ten_bo_phan,
nhan_vien.so_dien_thoai,
nhan_vien.dia_chi
from nhan_vien
join
trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
join 
bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join
hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where 
year(hop_dong.ngay_lam_hop_dong) between 2020 and 2021
group by hop_dong.ma_nhan_vien
having count(hop_dong.ma_nhan_vien)<=3
order by ma_nhan_vien;
-- task 16
select 
 nhan_vien.ma_nhan_vien,
 nhan_vien.ho_ten
 from
 nhan_vien; 
 set sql_safe_updates = 0;
 delete
 from nhan_vien
 where nhan_vien.ma_nhan_vien not in (select distinct ma_nhan_vien from hop_dong
 where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021 );
 set sql_safe_updates = 1;
 
 
 
 




