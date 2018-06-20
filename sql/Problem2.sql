-- using oracle
select Department,Employee,Salary
from
(select dep.Name as Department,
       emp.Name as Employee,
       emp.Salary,
       dense_rank() over(partition by emp.DepartmentId order by emp.Salary desc) srank
 from Employee emp
    join Department dep
    on emp.DepartmentId = dep.id) final
where srank <= 3;