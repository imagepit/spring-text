# mybatis

## 環境構築

### PostgreSQLにDB、テーブル追加

- [DB、ロール作成用SQL](sql/create_user.sql)
- [テーブル作成用SQL](sql/create_table.sql)

### mybatipseプラグインのインストール

![](img/mybatipse-01.png)

![](img/mybatipse-02.png)

![](img/mybatipse-03.png)

![](img/mybatipse-04.png)

![](img/mybatipse-05.png)

## 動作確認

### 依存関係の追加

![](img/mybatis-01.png)

### DB接続情報の設定

![](img/mybatis-02.png)

### Entityの作成

![](img/mybatis-03.png)

### Mapperインターフェースの作成

![](img/mybatis-04.png)

### MapperXMLの作成

![](img/mybatis-07.png)

![](img/mybatis-05.png)

![](img/mybatis-06.png)

![](img/mybatis-08.png)

### テストクラスの作成

![](img/mybatis-09.png)

![](img/mybatis-10.png)

## 演習問題

### 基本的なCRUDの問題

- 上記とテキストを参考に`ItemRepository.java`と`ItemRepository.xml`を更新してレコードを1件登録する処理を実装してください
  - 登録の確認は`ItemRepositoryTest.java`にテストケースを作り確認してください。
- 上記とテキストを参考に`ItemRepository.java`と`ItemRepository.xml`を更新してレコードを1件更新する処理を実装してください
  - 更新の確認は`ItemRepositoryTest.java`にテストケースを作り確認してください。
- 上記とテキストを参考に`ItemRepository.java`と`ItemRepository.xml`を更新してレコードを1件削除する処理を実装してください
  - 削除の確認は`ItemRepositoryTest.java`にテストケースを作り確認してください。
