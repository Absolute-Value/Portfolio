---
title: "SQL コマンド個人的メモ (SQLite & PostgreSQL)"
date: "2025-09-12 06:00:00"
update: "2025-09-12 06:00:00"
category: "Note"
hero: https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/330px-Postgresql_elephant.svg.png
tags: ["Memo", "SQL", "SQLite", "PostgreSQL"]
layout: note
excerpt: SQLiteとPostgreSQLで使える基本的なコマンドの個人的メモです。
toc: true
---

# はじめに

SQLiteとPostgreSQLで使える基本的なコマンドの個人的メモです。
SQLiteは軽量でファイルベースのデータベース、PostgreSQLは高機能なサーバー型データベースです。
データベースの作成からテーブル操作、データの管理まで基本的な操作をまとめています。

# データベースの接続と起動

## SQLite

```bash
# データベースファイルを作成/接続
sqlite3 database_name.db

# メモリ上のデータベース（一時的）
sqlite3 :memory:
```

## PostgreSQL

```bash
# デフォルトデータベースに接続
psql

# 指定したデータベースに接続
psql -d database_name

# ユーザー指定で接続
psql -U username -d database_name

# ホスト指定で接続
psql -h hostname -U username -d database_name
```

# データベース操作

## SQLite

```sql
-- 現在のデータベース情報
.databases

-- SQLiteを終了
.quit
```

## PostgreSQL

```sql
-- データベース一覧表示
\l

-- データベース作成
CREATE DATABASE database_name;

-- データベース削除
DROP DATABASE database_name;

-- データベースに接続
\c database_name

-- PostgreSQLを終了
\q
```

# テーブル操作

## テーブル作成

### SQLite

```sql
CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT,
    user_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### PostgreSQL

```sql
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## カラムの追加

### SQLite

```sql
-- カラム追加
ALTER TABLE users ADD COLUMN phone TEXT;

-- カラム追加（デフォルト値付き）
ALTER TABLE users ADD COLUMN status TEXT DEFAULT 'active';

-- 注意: SQLiteではカラムの削除や変更は制限があります
```

### PostgreSQL

```sql
-- カラム追加
ALTER TABLE users ADD COLUMN phone VARCHAR(20);

-- カラム追加（デフォルト値付き）
ALTER TABLE users ADD COLUMN status VARCHAR(20) DEFAULT 'active';

-- カラム削除
ALTER TABLE users DROP COLUMN phone;

-- カラム名変更
ALTER TABLE users RENAME COLUMN phone TO phone_number;

-- カラムのデータ型変更
ALTER TABLE users ALTER COLUMN age TYPE BIGINT;
```

# メタコマンド操作

## SQLite

| コマンド | 説明 |
| - | - |
| .tables | テーブル一覧表示 |
| .schema | 全テーブルのスキーマ表示 |
| .schema table_name | 指定テーブルのスキーマ表示 |
| .describe table_name | テーブル構造表示 |
| .indexes | インデックス一覧表示 |
| .mode | 出力モード変更 |
| .headers on/off | ヘッダー表示の切り替え |
| .output filename | 出力をファイルに保存 |
| .read filename.sql | SQLファイルを実行 |

## PostgreSQL

| コマンド | 説明 |
| - | - |
| \dt | テーブル一覧表示 |
| \d | 全オブジェクト一覧表示 |
| \d table_name | 指定テーブルの詳細表示 |
| \di | インデックス一覧表示 |
| \du | ユーザー一覧表示 |
| \dn | スキーマ一覧表示 |
| \df | 関数一覧表示 |
| \x | 拡張表示の切り替え |
| \o filename | 出力をファイルに保存 |
| \i filename.sql | SQLファイルを実行 |

# データ操作

## データの挿入

```sql
-- 単一データ挿入
INSERT INTO users (name, email, age) VALUES ('田中太郎', 'tanaka@example.com', 30);

-- 複数データ挿入
INSERT INTO users (name, email, age) VALUES 
    ('佐藤花子', 'sato@example.com', 25),
    ('鈴木一郎', 'suzuki@example.com', 35);
```

## データの更新

```sql
-- 条件付き更新
UPDATE users SET age = 31 WHERE name = '田中太郎';

-- 複数カラム更新
UPDATE users SET age = 26, email = 'sato_new@example.com' WHERE name = '佐藤花子';
```

## データの削除

```sql
-- 条件付き削除
DELETE FROM users WHERE age > 40;

-- 全データ削除（テーブル構造は残る）
DELETE FROM users;
```

## データの検索

```sql
-- 基本的な検索
SELECT * FROM users;
SELECT name, email FROM users WHERE age >= 30;

-- 並び替え
SELECT * FROM users ORDER BY age DESC;

-- 件数制限（SQLiteとPostgreSQL共通）
SELECT * FROM users LIMIT 5;

-- 結合
SELECT u.name, p.title 
FROM users u 
JOIN posts p ON u.id = p.user_id;
```

# インデックス操作

```sql
-- インデックス作成
CREATE INDEX idx_users_email ON users(email);

-- 複合インデックス作成
CREATE INDEX idx_users_name_age ON users(name, age);

-- ユニークインデックス作成
CREATE UNIQUE INDEX idx_users_unique_email ON users(email);

-- インデックス削除
DROP INDEX idx_users_email;
```

# バックアップとリストア

## SQLite

```bash
# データベースダンプ
sqlite3 database.db .dump > backup.sql

# データベースリストア
sqlite3 new_database.db < backup.sql

# データベースファイルコピー（SQLiteは単一ファイル）
cp database.db backup_database.db
```

## PostgreSQL

```bash
# データベースダンプ
pg_dump database_name > backup.sql

# 特定のテーブルのみダンプ
pg_dump -t table_name database_name > table_backup.sql

# データベースリストア
psql database_name < backup.sql

# カスタムフォーマットでダンプ
pg_dump -Fc database_name > backup.dump

# カスタムフォーマットのリストア
pg_restore -d database_name backup.dump
```

# トランザクション

```sql
-- トランザクション開始
BEGIN;

-- データ操作
INSERT INTO users (name, email) VALUES ('テストユーザー', 'test@example.com');
UPDATE users SET age = 40 WHERE name = 'テストユーザー';

-- コミット（確定）
COMMIT;

-- ロールバック（取り消し）
ROLLBACK;
```

# 設定ファイルのカスタマイズ

## SQLite設定

```bash
# ~/.sqlitercファイル作成
echo ".mode column" > ~/.sqliterc
echo ".headers on" >> ~/.sqliterc
echo ".nullvalue NULL" >> ~/.sqliterc
```

## PostgreSQL設定

```bash
# ~/.psqlrcファイル作成例
\set PROMPT1 '%M:%> %n@%/%R%#%x '
\set HISTSIZE 10000
\pset null 'NULL'
\x auto
```

# よくあるトラブルシューティング

## SQLite

```bash
# データベースファイルがロックされた場合
# プロセスを確認して終了
lsof database.db

# データベースの整合性チェック
sqlite3 database.db "PRAGMA integrity_check;"
```

## PostgreSQL

```bash
# 接続できない場合の確認
# PostgreSQLサービスの状態確認
sudo systemctl status postgresql

# ポートの確認
sudo netstat -tlnp | grep 5432

# ログの確認
sudo tail -f /var/log/postgresql/postgresql-*.log
```

# 参考になるURL

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQLite vs PostgreSQL比較](https://www.sqlite.org/whentouse.html)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)