create table `s`
(
    `Sno` varchar(255)  ,
    `Sname` varchar(255),
    `status` int ,
    `city` varchar(255) ,
      PRIMARY KEY (`Sno`)
)ENGINE=InnoDB default CHARSET=utf8;
INSERT INTO `s` 
VALUES 
('S1','精益',20,'天津'),
('S2','盛锡',10,'北京'),
('S3','东方红',30,'北京'),
('S4','丰泰盛',20,'天津'),
('S5','为民',30,'上海');

select *from s;
------------------------------
create table `p`
(
    `pno` varchar(255)  ,
    `pname` varchar(255)  ,
    `color` varchar(255)  ,
    `weight` int ,
    PRIMARY KEY (`pno`)
)ENGINE=InnoDB default CHARSET=utf8;
INSERT into `p`
VALUES
('P1','螺母','红',12),
('P2','螺栓','绿',17),
('P3','螺丝刀','蓝',14),
('P4','螺丝刀','红',14),
('P5','凸轮','蓝',40),
('P6','齿轮','红',30);

select *from p;
------------------------------
create table `j`
(
    `jno` varchar(255)  ,
    `jname` varchar(255)  ,
    `city` varchar(255)  ,
     PRIMARY KEY (`jno`)
)ENGINE=InnoDB default CHARSET=utf8;
INSERT into `j`
values 
('J1','三建','北京'),
('J2','一汽','长春'),
('J3','弹簧厂','天津'),
('J4','造船厂','天津'),
('J5','机车厂','唐山'),
('J6','无线电厂','常州'),
('J7','半导体厂','南京');

select *from j;
------------------------------
create table `spj`
(
    `sno` varchar(255)  ,
    `pno` varchar(255)  ,
    `jno` varchar(255)  ,
    `qty` int 
)ENGINE=InnoDB default CHARSET=utf8;
insert into spj
values
('S1','P1','J1',200),
('S1','P1','J3',100),
('S1','P1','J4',700),
('S1','P2','J2',100),
('S2','P3','J1',400),
('S2','P3','J2',200),
('S2','P3','J4',500),
('S2','P3','J5',400),
('S2','P5','J1',400),
('S2','P5','J2',100),
('S3','P1','J1',200),
('S3','P3','J1',200),
('S4','P5','J1',100),
('S4','P6','J4',200),
('S5','P2','J3',100),
('S5','P3','J1',200),
('S5','P6','J2',200),
('S5','P6','J4',200);

select *from spj;