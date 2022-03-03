use quanlysinhvien2 ;
 select * from `subject` where Credit = (select max(Credit) from `subject`) ;
 
 
 select `subject`.*, mark.Mark from `subject` 
 join mark on `subject` .SubId = Mark.SubId order by Mark desc limit 1 ;
  
select student.*, avg(mark)
from student join mark on student.StudentId = Mark.Studentid 
group by student.StudentId;
