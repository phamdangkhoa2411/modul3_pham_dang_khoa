drop database ban_hang;
create database ban_hang;
use ban_hang;
create table phieu_xuat(
so_px int ,
ngay_xuat date ,
primary key (so_px)
);
create table vat_tu(
ma_vtu int  ,
ten_vtu varchar(100),
primary key (ma_vtu)
);
create table phieu_nhap(
so_pn int ,
ngay_nhap date,
primary key (so_pn)
);
create table don_dat_hang(
so_dh int ,
ngay_dh date,
primary key (so_dh)
);
create table nha_cung_cap(
ma_ncc int,
ten_ncc varchar(50),
dia_chi varchar(100),
so_dt  varchar(50),
primary key (ma_ncc)
);
create table chi_tiet_phieu_xuat(
dg_xuat int,
xl_xuat int,
so_px int ,
ma_vtu int  ,
primary key (so_px,ma_vtu),
foreign key (so_px) references phieu_xuat (so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
create table chi_tiet_phieu_nhap(
dg_nhap int,
xl_nhap int ,
so_pn int ,
ma_vtu int  ,
primary key(so_pn,ma_vtu),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);
create table chi_tiet_don_dat_hang(
ma_vtu int  ,
so_dh int ,
primary key(so_dh,ma_vtu),
foreign key(so_dh)references don_dat_hang(so_dh),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);
create table cung_cap(
so_dh int ,
ma_ncc int,
primary key(so_dh,ma_ncc),
foreign key(so_dh)references don_dat_hang(so_dh),
foreign key(ma_ncc) references  nha_cung_cap(ma_ncc)
);



