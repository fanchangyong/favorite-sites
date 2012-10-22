drop database if exists webjoyce;
create database webjoyce;
use webjoyce;

-- �û���
create table user
(
	userid int(64) not null primary key, -- �û�ΨһID
	email varchar(128) not null, -- email��Ҳ���û���
	rescue_email varchar(128) not null, -- �һ������õ�email
	password varchar(32) not null, -- ���� 
	nickname varchar(32) not null -- �ǳ�
);

-- ��վ��
create table website
(
	siteid int(64) not null primary key, -- ��վΨһID
	url varchar(128) not null,
	desc varchar(128) not null, -- ����
	screen_shot blob null ,-- ��ͼ		
);

-- ���ࣨ���򣩱�
create table domain
(
	domainid int(64) not null primary key,
	name varchar(32) not null,
	desc varchar(128) not null,
);

-- ��վ�����
create table website_domain
(
	siteid int(64) not null,
	domainid int(64) not null
);

-- �û���ע����վ
create table user_follow_website
(
	userid int(64) not null,
	websiteid int(64) not null
);

-- �û���ע������
create table user_follow_domain
(
	userid int(64) not null,
	domainid int(64) not null
);

-- �û���ע����
create table user_folow_idol
(
	userid int(64) not null,
	idolid int(64) not null
);

-- ֪ͨ����
create table user_notification
(
	userid int(64) not null,
	operator int(64) not null,
	target int(64) not null,
	target_type int(8) not null,	
);
