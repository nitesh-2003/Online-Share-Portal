# Online-Share-Portal
Procedure to run myshare java project.

MyShares.Com is a website that allows registered users to get information about their shares in different companies and their current values. 
It provides all the common operations related to users such as registration, login, change password and forgot password. 
Architecture Of the Project
This project uses JSF to build the interface. Managed Beans talk to DAO (Data Access Objects), which talk to database using JDBC. 
So overall architecure is - JSF Components -> Managed Beans -> DAO -> JDBC -> Oracle Database. 
It also uses a filter (Intercepting Filter design pattern) to ensure only authenticated users access secured pages. 
Products used in this project
Oracle10g Express Edition
NetBeans IDE 6.5
Jdk 6.0
Tomcat 6.x
CMail Server  5.x
Steps to download and deploy this project
Download myshare.rar. The .rar file contains the entire source code for the project. Unzip the file into C:\ so that c:\myshares folder is create with all the components of the project. 
Go to properties of the project using popup menu. Select libraries node and delete existing libraries using  Remove button. Then add - mail.jar and activation.jar (for javamail) and Oracle - ojdbc14.jar. You have to add these .jar files to the project using Add Jar/Folder button. 
Add JSF 1.2 libraries using Add Library button
Create myshares account with password myshares in Oracle10g Express Edition. This must be done after you log in as SYSTEM user. Then create tables listed below. 

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
  
Create an account in CMail Server (Mail Server from youngzsoft.net and configure Outlook express to add a mail account for the user created in CMail Server. At the time of registering user in the project using newuser.jsp, use this email address for user so that you can test forgot password feature using this email address.
Start NetBeans 6.5. Open the project from c:\myshares folder. 
Run this project - you must see login.jsp page. 
