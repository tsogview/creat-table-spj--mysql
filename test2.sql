--A.	取出供应商S1提供的零件的颜色；
select distinct color 
from spj left join p on spj.pno=p.pno
where sno = 'S1'
--B.	取出天津的找出上海厂商供应的所有零件号码；
select distinct pno 
from s right join spj on s.sno =spj.sno
where city = '上海' or city = '天津'
--C.	供应商提供给天津任一工程的零件的代号；
select pno as 工程的零件的代号
from j right join spj on j.jno=spj.jno
where j.city = '天津'
--D.	找出工程项目J2所使用的各种零件的名称以及数量；
select pname , qty 
from p right join spj on p.pno=spj.pno
where jno = 'J1'
--E.	取出至少有一个和工程不在同一城市的供应商提供零件的工程代号；
select distinct j.jno
from j,s,spj where s.sno=spj.sno and j.jno =spj.jno and s.city!=j.city
where 
--F.	取出为工程J1提供红色零件的供应商代号；
select distinct sno as 供应商代号
from  p right join spj on p.pno=spj.pno
where p.color = '红'
--G.	取出 为所在城市为北京的 工程提供零件的 供应商代号；
select distinct s.sno as 供应商代号
from j,s,spj where s.sno=spj.sno and j.jno =spj.jno
and j.city = '北京'
--H.	取出这样一些供应商代号，他们能够提供至少一种红色零件的供应商所提供的零件；
select distinct s.sno as 供应商代号
from s,p,spj where s.sno=spj.sno and p.pno = spj.pno
and p.color = '红'
--I.	取出由供应商S1提供零件的工程名称；
select distinct jname 
from j right join spj on j.jno=spj.jno 
where sno = 'S1' 
--J.	取出为所在城市为上海或北京的工程提供红色零件的供应商代号；
select distinct  spj.sno 
from s,p,j,spj where s.sno=spj.sno and j.jno = spj.jno and p.pno=spj.pno
and j.city in  ('北京','上海')and p.color = '红' 
--K.	取出供应商与工程所在城市相同的供应商提供的零件代号；
select distinct p.pno 
from s,p,j,spj where s.sno=spj.sno and j.jno = spj.jno and p.pno=spj.pno
and s.city= j.city 
--外连接操作：
--L.	显示所有的项目以及其供应商、所用零件情况；
select distinct spj.jno ,spj.sno ,spj.pno
from s,p,j,spj where s.sno=spj.sno and j.jno = spj.jno and p.pno=spj.pno
--M.	显示所有的零件以及所用于的项目、供应商商情况；
select distinct spj.pno,spj.jno ,spj.sno 
from s,p,j,spj where s.sno=spj.sno and j.jno = spj.jno and p.pno=spj.pno
--自连接：
--N.	求和“东方红”在同一个城市的供应商的名称；
select a.sname
from s as a,s as b where b.sname = '东方红'
and a.city = b.city 
--O.	求和“螺母”的颜色相同的零件的的编号、名称以及重量；
select a.pno ,a.pname ,a.weight 
from p as a ,p as b where b.pname = '螺母'
and a.color = b.color 
--使用IN关键字：
--P.	取出重量最轻的零件代号；
select top 1 pno 
from p
order by weight
Q.	找出没有使用天津产的零件的工程名称；
select distinct j.jname as 使用天津产的零件的工程名称
from s,p,j,spj where s.sno=spj.sno and j.jno = spj.jno and p.pno=spj.pno
and  s.city ='天津'
R.	求没有使用天津供应商生产的红色零件的工程号；
select distinct j.jno as 用天津供应商生产的红色零件的工程号
from s,p,j,spj where s.sno=spj.sno and j.jno = spj.jno and p.pno=spj.pno
and  s.city ='天津' and p.color = '红'
--S.	求和“东方红”在同一个城市的供应商的名称；
select a.sname
from s as a,s as b where b.sname = '东方红'
and a.city = b.city 
--T.	求和“螺母”的颜色相同的零件的的编号、名称以及重量；
select a.pno ,a.pname ,a.weight 
from p as a ,p as b where b.pname = '螺母'
and a.color = b.color 
--U.	取出上海供应商不提供任何零件的工程代号；
select distinct jno as 上海供应商提供零件的工程代号
from s right join spj on s.sno =spj.sno
where s.city in ('上海')