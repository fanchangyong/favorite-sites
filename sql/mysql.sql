drop database if exists webjoyce;
create database webjoyce;
use webjoyce;

-- 用户表
create table user
(
	userid int(64) not null primary key, -- 用户唯一ID
	email varchar(128) not null, -- email，也是用户名
	rescue_email varchar(128) not null, -- 找回密码用的email
	password varchar(32) not null, -- 密码 
	nickname varchar(32) not null -- 昵称
);

-- 网站表
create table website
(
	siteid int(64) not null primary key, -- 网站唯一ID
	url varchar(128) not null,
	desc varchar(128) not null, -- 描述
	screen_shot blob null ,-- 截图		
);

-- 分类（领域）表
create table domain
(
	domainid int(64) not null primary key,
	name varchar(32) not null,
	desc varchar(128) not null,
);

-- 网站分类表
create table website_domain
(
	siteid int(64) not null,
	domainid int(64) not null
);

-- 用户关注的网站
create table user_follow_website
(
	userid int(64) not null,
	websiteid int(64) not null
);

-- 用户关注的领域
create table user_follow_domain
(
	userid int(64) not null,
	domainid int(64) not null
);

-- 用户关注的人
create table user_folow_idol
(
	userid int(64) not null,
	idolid int(64) not null
);

-- 通知中心
create table user_notification
(
	userid int(64) not null,
	operator int(64) not null,
	target int(64) not null,
	target_type int(8) not null,	
);
