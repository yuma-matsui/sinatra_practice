# My memo

メモの保存・管理をするための個人向けアプリケーションです。

# DEMO

[Gyazo](https://gyazo.com/0ed2f390b5d335ea56e2c80e3a237b56)

# Features

とても簡易的なメモになってます。
デザインは3色のみ使用して統一感を意識しました。

# Requirement

* ruby 3.1.0
* postgresql 14.2
* gem sinatra
* gem webrick
* gem pg
# Usage

- DBの準備

```bash
# データベース作成のDDL
postgres=$ CREATE DATABASE mymemo;

# テーブル作成のDDL
mymemo=$ CREATE TABLE memo(
id SERIAL NOT NULL,
title VARCHAR(100) NOT NULL,
content VARCHAR(255) NOT NULL,
created_at TIMESTAMP,
updated_at TIMESTAMP,
PRIMARY KEY (id));
```

- 実行手順

```bash
git clone https://github.com/yuma-matsui/sinatra_practice.git
cd sinatra_practice
bundle install
ruby main.rb
```

# Author
* 作成者: yum
* 所属: fjord boot camp

# テーブル設計
## memoテーブル
| カラム名   | 型           | 制約                                  |
| -----------| ------------ | --------------------------------------|
| id         | SERIAL       | PRIMARY KEY, NOT NULL, AUTO_INCREMENT |
| title      | VARCHAR(100) | NOT NULL                              |
| content    | VARCHAR(255) | NOT NULL                              |
| created_at | TIMESTAMP    | DEFAULT now()                         |
| updated_at | TIMESTAMP    | DEFAULT now()                         |
