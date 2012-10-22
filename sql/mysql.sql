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

-- 用户收藏的网址
create table favorite_websites
(
	id int(64) not null auto_incremental primary key,
	websiteid int(64) not null,
	userid int(64) not null
);

-- 通知中心 ,比如XX用户在XX领域新上传了网站XX
create table user_notification
(
	userid int(64) not null,
	operator int(64) not null,
	target int(64) not null,
	target_type int(8) not null,
	operation_type int(8) not null,
	state int(8) not null
);

-- 修改记录,比如 XX用户 给 XX网站 添加了截图
create table modification
(
	modid int(64) not null, 
	operator int(64) not null,-- 操作者ID
	objectid int(64) not null,-- 操作对象ID
	object_type int(8) not null, -- 对象类型
	operation_type int(8) not null -- 做了什么操作
);

-- 网站评论表
create table website_comment
(
	commentid int(64) not null,
	websiteid int(64) not null,
	userid int(64) not null,
	comment varchar(1024) not null
);