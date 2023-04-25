create database Test2;
use Test2;
-- Tạo bảng Students
create table Students(
studentId int(4) primary key auto_increment,
studentName varchar(50),
age int(4),
email varchar(100) 
);
-- Tạo bảng Classes
create table classes(
classId int(4) primary key,
className varchar(50)
);
-- Tạo bảng classStudent
create table classStudent(
studentId int(4),
foreign key(studentId) references Students(studentId),
classId int(4),
foreign key(classId) references classes(classId)
);

-- Tạo bảng Subjects
create table subjects(
subjectId int(4) primary key,
subjectName varchar(50)
);
-- tọa bảng Marks
create table marks(
mark int ,
subjectId int(4),
foreign key(subjectId) references subjects(subjectId),
studentId int(4),
foreign key (studentId) references Students(studentId)
);
 -- chèn dữ liệu vào bảng students
 insert into students(studentName,age,email) values
 ("Nguyễn Quang An",18,"an@yahoo.com"),
 ("Nguyễn Công Vinh",20,"vinh@gmail.com"),
 ("Nguyễn Văn Quyến",19,"quyen"),
 ("Phạm Thanh Bình",25,"binh@.com"),
 ("Nguyễn Văn Tài Em",30,"taiem@sport.vn");
 
 -- chèn dữ liệu vào bảng classes
 insert into classes  values
 (1,"C0706L"),
 (2,"C0708G");
 -- chèn dữ liệu vào bảng subjects
 insert into subjects values
 (1,"SQL"),
 (2,"Java"),
 (3,"C"),
 (4,"Visual Basic");

 -- chèn dữ liệu vào bảng classStudent
 insert into classStudent values
 (1,1),
 (2,1),
 (3,2),
 (4,2),
 (5,2);
 -- chèn dữ liệu vào bảng marks
 insert into marks values
 (8,1,1),
 (4,2,1),
 (9,1,1),
 (7,1,3),
 (3,1,4),
 (5,2,5),
 (8,3,3),
 (1,3,5),
 (3,2,4);

-- 1. hiển thị danh sách tất cả học viên
select * from students;
-- 2. hiển thị danh sách tất cả các môn học 
select * from subjects;
-- 3. Tính điểm trung bình
select avg(mark) as `diem trung binh` from marks;
-- 4. Hiển thị môn học nào có học sinh được điểm cao  nhất
select sb.subjectName, m.mark from subjects sb join marks m on sb.subjectId=m.subjectId where m.mark=(select max(mark) from marks);
-- 5 . Đánh số thứ tự của điểm theo chiều giảm dần
select @stt:=@stt+1 as `stt` , m.mark from (select @stt:=0) r ,marks m order by mark desc;
-- 6. Thay đổi kiểu dữ liệu của cột subjectName trong bảng subject thành nvarchar
alter table subjects 
modify subjectName nvarchar(255);
-- 7 . Cập nhật thêm dòng chữ
update subjects
set subjectName=concat("« Day la mon hoc ",subjectName);
-- 8. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table students
modify age int(4) check(age>15 and age<50);
-- 9. Loại bỏ tất cả quan hệ giữa các bảng
alter table classStudent
drop foreign key classstudent_ibfk_1;
alter table classStudent
drop foreign key classstudent_ibfk_2;
alter table marks
drop foreign key marks_ibfk_1;
alter table marks
drop foreign key marks_ibfk_2;
-- 10 . Xóa học viên có studentID =1
delete from students where studentId=1;
-- 11. Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table Students
add column `status` bit default(1);
-- 12. Cap nhap gia tri Status trong bang Student thanh 0
update students
set `status`=0;






