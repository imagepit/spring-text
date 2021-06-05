# Spring Securityの動作確認

## 処理の流れ

![](img/spring-security-sequence.png)

## 環境構築

### テーブル定義ファイル作成

![](img/spring-security-01.png)

### 依存関係の追加

![](img/spring-security-02.png)

## ユーザの登録機能実装

### Entityの実装

![](img/spring-security-03.png)

![](img/spring-security-04.png)

### Repositoryの実装

![](img/spring-security-05.png)
![](img/spring-security-06.png)

### Serviceの実装

![](img/spring-security-07.png)

![](img/spring-security-08.png)

### パスワードエンコードのDI設定

![](img/spring-security-09.png)

### Serviceのテスト

- **AccountServiceTest.java**を実行して暗号化されたパスワードでユーザを登録している状態にしておいてください。

![](img/spring-security-10.png)

![](img/spring-security-11.png)

![](img/spring-security-12.png)


## 認証・認可機能の実装

### AccountReposirotyの更新

![](img/spring-security-13.png)

![](img/spring-security-14.png)

### UserDetailインターフェース実装クラスの実装

![](img/spring-security-15.png)

### UserDetailServiceインターフェース実装クラスの実装

![](img/spring-security-16.png)

### SecurityConfigクラスの実装

![](img/spring-security-17.png)

### コントローラーの実装

![](img/spring-security-18.png)

### Viewの実装

_src/main/resources/templates/login.html_

![](img/spring-security-19.png)

_src/main/resources/templates/menu.html_

![](img/spring-security-20.png)

### ログイン認証時のエラーメッセージの定義

![](img/spring-security-21.png)
spring-security-22

### 動作確認

![](img/spring-security-login.png)

![](img/spring-security-menu-admin.png)

![](img/spring-security-menu-user.png)

![](img/spring-security-menu-guest.png)