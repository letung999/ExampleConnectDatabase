create database conductKaraoke
use conductKaraoke
create table room(
IdOfRoom varchar(10) not null primary key,
kindOfRoom nvarchar(100) not null,
numOfPerson int not null,
fee float not null,
looklike nvarchar(100) not null
)
go
create table customer(
IdCustomer varchar(15) not null primary key,
address nvarchar(100) not null,
phone varchar(15) not null
)
go

create table orderRoom(
idOfOrderRoom varchar(10) not null primary key,
IdOfRoom varchar(10) not null,
IdCustomer varchar(15) not null,
orderOfDay date not null,
startTime time not null,
endtime time not null,
moneyRoom float not null,
node nvarchar(100) not null,
status nvarchar(100) not null,
constraint FK1 foreign key(IdOfRoom) references room(IdOfRoom),
constraint FK2 foreign key(IdCustomer) references customer(IdCustomer)
)
go
create table addService(
idService varchar(10) not null primary key,
nameService varchar(50) not null,
unit varchar(10) not null,
bill float not null
)
create table detailOfService(
idOfOrderRoom varchar(10) not null,
idService varchar(10) not null,
total int not null,
primary key(idOfOrderRoom, idService),
constraint FK3 foreign key(idService) references addService(idService),
constraint FK4 foreign key(idOfOrderRoom) references orderRoom(idOfOrderRoom) 
)
alter table customer
add nameCustomer varchar(100)
insert into room values
('XA1','Loai1',2,100,'good'),
('XA2','Loai1',1,50,'good'),
('XA3,','Loai1',1,25,'normal'),
('XA4','Loai2',2,100,'excellent'),
('MS1','Loai3',1,200,'good'),
('MS2','Loai3',2,100,'normal'),
('MS4','Loai2',4,150,'normal'),
('XH1','Loai1',5,300,'normal'),
('XH2','Loai3',3,250,'good'),
('B1','Loai1',4,100,'good'),
('GYM1','Loai1',4,200,'good'),
('GYM2','Loai2',10,300,'good')
go
insert into customer values
('P1','Tp Ho Chi Minh','0905587389','Le Quang Tung'),
('P2','Quang Ngai','0338257409','Nguyen Hoai Nam'),
('P3','Ha Noi','0908567489','Nguyen Hoang Long'),
('P4','Thai Binh','0908765498','La Quoc Hung'),
('P5','Quang Nam','0908557843','Nguyen Quoc Bao'),
('P6','Ha Tinh','09007553383','Doan Thai Luyen'),
('P7','Hue','0908446738','Nguyen Van Chung'),
('P8','Thai Binh','0338257403','Nguyen Van Canh'),
('P9','Thai Binh','0908126743','Duong Thi Hong Hien'),
('P10','Long An','022378478','Thai Nhi Bao Lang')
insert into customer values('P11','Tp Ho Chi Minh','0905587389','Le Quang Tung')
go
insert into orderRoom values
('OD1','XA1','P1','2020-01-01','09:00:00','00:00:00',20,'NoProblem','accept'),
('OD2','XA2','P2','2020-02-01','10:00:00','00:00:00',25,'NoProblem','accept'),
('OD3','XA1','P3','2020-03-01','19:00:00','00:00:00',27,'NoProblem','accept'),
('OD4','XH1','P4','2020-04-01','19:00:00','00:00:00',21,'NoProblem','cancel'),
('OD5','XH2','P5','2020-07-01','08:00:00','00:00:00',29,'NoProblem','cancel'),
('OD6','XA4','P6','2020-09-01','08:00:00','00:00:00',20,'NoProblem','cancel'),
('OD7','GYM1','P7','2020-11-01','07:00:00','00:00:00',30,'NoProblem','accept'),
('OD8','MS1','P8','2020-05-01','05:00:00','00:00:00',20,'NoProblem','cancel'),
('OD9','MS2','P9','2020-07-01','06:00:00','00:00:00',17,'NoProblem','accept'),
('OD10','XA1','P10','2020-09-01','04:00:00','00:00:00',10,'NoProblem','accept')
go
insert into addService values
('SV1','Karaoke','gio',50),
('SV2','beer','thung',300),
('SV3','hotgirl','nguoi',500),
('SV4','trai cay','dia',5),
('SV5','maxxa','gio',50)
go
insert into detailOfService values
('OD1','SV1',1),
('OD2','SV2',5),
('OD3','SV3',5),
('OD4','SV4',1),
('OD5','SV2',7),
('OD6','SV1',1),
('OD7','SV5',3),
('OD8','SV5',3),
('OD9','SV4',3)
/*
Câu 1:Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ có số lượng lớn hơn 3 và nhỏ hơn 10. (1 điểm)

Câu 2: Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ so với giá phòng hiện tại,
chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 3. (1 điểm)

Câu 3: Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) có trạng thái đặt (TrangThaiDat) là “Da huy”. (1 điểm)

II.
Câu 4: Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, “N”, “M” và có độ dài tối đa là 20 ký tự. (1 điểm)

Câu 5: Hiển thị TenKH của tất cả các khách hàng có trong hệ thống,
(1 đ TenKH nào trùng nhau thì chỉ hiển thị một lần.
Sinh viên sử dụng hai cách khác nhau để thực hiện yêu cầu trên, mỗi cách sẽ được 0,5 điểm. iểm)

Câu 6: Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm 
có DonViTinh là “thung” và có DonGia lớn hơn 10,000 VNĐ  
hoặc những dịch vụ đi kèm có DonViTinh là “dia” và có DonGia nhỏ hơn 5,000 VNĐ. (1 điểm)

Câu 7: Hiển thị MaDatPhong, MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong,
MaKH, TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, MaDichVu, SoLuong, DonGia
của những đơn đặt phòng có năm đặt phòng là tu thang 1 den thang 11
và đặt những phòng có giá phòng > 20 do la (1 điểm)

III.
Câu 8:Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH,
NgayDat, TongTienHat, TongTienSuDungDichVu, TongTienThanhToan
tương ứng với từng mã đặt phòng có trong bảng DAT_PHONG.
Những đơn đặt phòng nào không sử dụng dịch vụ đi kèm thì cũng liệt kê thông tin của đơn đặt phòng đó ra. (1 điểm)
TongTienHat = GiaPhong * (GioKetThuc – GioBatDau)
TongTienSuDungDichVu = SoLuong * DonGia
TongTienThanhToan = TongTienHat + sum (TongTienSuDungDichVu)

Câu 9: Hiển thị MaKH, TenKH, DiaChi, SoDT
của những khách hàng đã từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”. (1 điểm)

Câu 10: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat
của những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần
và trạng thái đặt là “Da dat”. (1 điểm)

*/
use conductKaraoke
--------------------------------------------------------------------------------------------------------------------
select dt.idOfOrderRoom,dt.idService from detailOfService as dt
where dt.total>3 and dt.total<6
--------------------------------------------------------------------------------------------------------------------
use conductKaraoke
drop table room1
select * into room1 from room
select * from room1
declare updateRoom1 cursor for select fee, numOfPerson from room1
open updateRoom1
declare @fee int
declare @numOfPerson int 
fetch next from updateRoom1 into @fee, @numOfPerson
while @@FETCH_STATUS = 0
begin
if @numOfPerson >3
begin
update room1 set fee += 10 where fee = @fee
end
else
if @numOfPerson<=3
begin
update room1 set fee = fee where fee = @fee
end
fetch next from updateRoom1 into @fee, @numOfPerson
end
close updateRoom1
deallocate updateRoom1
select *from room
select * from room1
------------------------------------------------------------------------------------------------------------------------
select * into orderRoom1 from orderRoom
delete from orderRoom1 where status ='cancel'
select * from orderRoom1
-------------------------------------------------------------------------------------------------------------------
declare @len int
select @len = len(ct.nameCustomer) from customer as ct
select ct.nameCustomer from customer as ct 
where (ct.nameCustomer like'H%' or ct.nameCustomer like'N%' or ct.nameCustomer like'M%') and @len<=20
--------------------------------------------------------------------------------------------------------------------
select ct.nameCustomer from customer as ct
group by ct.nameCustomer
---------------------------------------------------------------------------------------------------------------------
select distinct(ct.nameCustomer) from customer as ct
------------------------------------------------------------------------------------------------------------------
select *from addService as ads
where (ads.unit ='dia' or ads.unit ='thung') and ads.bill<300
------------------------------------------------------------------------------------------------------------------
select * from orderRoom as oRm 
where (oRm.moneyRoom>20) and (oRm.orderOfDay between '2020-01-01' and '2020-11-01')
order by oRm.moneyRoom desc
-------------------------------------------------------------------------------------------------------------------
select od.idOfOrderRoom, od.IdOfRoom,od.moneyRoom, od.orderOfDay,r.kindOfRoom, c.nameCustomer, ad.nameService
from orderRoom as od
inner join room as r on r.IdOfRoom = od.IdOfRoom
inner join customer as c on c.IdCustomer = od.IdCustomer 
inner join detailOfService as dt on dt.idOfOrderRoom = od.idOfOrderRoom
inner join addService as ad on ad.idService = dt.idService
--------------------------------------------------------------------------------------------------------------------
select c.IdCustomer, c.nameCustomer, c.address from customer as c
where c.address = 'Thai Binh'
--------------------------------------------------------------------------------------------------------------------
select r.IdOfRoom, r.kindOfRoom, r.numOfPerson as totalPerson, r.fee, count(od.IdCustomer) as numOfOrder
from room as r, orderRoom as od
where r.IdOfRoom = od.IdOfRoom
group by r.IdOfRoom, r.kindOfRoom,r.numOfPerson, r.fee
having COUNT(r.numOfPerson)>0
order by totalPerson desc

