
use quanlysinhvien2 ;

-- hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’:
select student. * from quanlysinhvien2.student where student.studentname like "h%"; 
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12:
select class. * from quanlysinhvien2.class where class.startdate like "%12%";

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5:
select `subject`. * from quanlysinhvien2.`subject` where   `subject`.credit between 3 and 5 ;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2:
update student set classid = 2 where studentname = "hung";
select * from Student
where ClassID = 2;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

SELECT student.studentname, `subject`.subname, mark.mark FROM student 
JOIN mark ON student.studentid = mark.studentid 
JOIN `subject` ON mark.subid = `subject`.subid
ORDER BY mark DESC, student.studentname ASC;
 