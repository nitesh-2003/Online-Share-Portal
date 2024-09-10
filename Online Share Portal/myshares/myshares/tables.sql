create user myshares identified by myshares;
grant all privileges to myshares;

connect myshares/myshares

create table users
( userid  number(5) primary key,
  email  varchar2(50)  unique,
  pwd   varchar2(10) not null
);


create table shares
( stockcode  varchar2(10) primary key,
  company      varchar2(50) unique,
  sharevalue   number(10,2)
);


create table user_shares
(  userid      number(5) references users(userid),
   stockcode varchar2(10) references shares(stockcode),
   noshares  number(5),
   primary key (userid,stockcode)
);

create sequence userid_seq start with 1 increment by 1 nocache;

insert into users values(userid_seq.nextval, 'a@a.com','a');
insert into users values(userid_seq.nextval, 'b@b.com','b');

insert into shares values('infosys','InfoSys Ltd',2000);
insert into shares values('tcs','Tata Consultancy services',1400);
insert into shares values('sbi','State Bank Of India',600);






  