# Spring Bootプロジェクトの作成

## eclipseでSpring Bootプロジェクトの作成

eclipseを起動して「ファイル -> 新規 -> その他」を選択します。

![](img/hello-spring-new-project.png)

「Spring Boot」の中の「Springスターター・プロジェクト」を選択して「次へ」をクリックします。

![](img/hello-spring-new-project-1.png)

名前は「spring」にし型は「Gradle（Buildship 3.x）」を選択して「次へ」をクリックします。

![](img/hello-spring-new-project-2.png)

プロジェクトの依存関係の画面は入力欄に「lombok」を入力し、開発ツールの「Lombok」にチェックをして「次へ」をクリックします。

![](img/hello-spring-new-project-4.png)

次の画面は「完了」ボタンをクリックします。

![](img/hello-spring-new-project-5.png)

Spring Bootのプロジェクトが作成されました。

![](img/hello-spring-new-project-6.png)

プロジェクト作成直後は依存関係のダウンロードでしばらく時間がかかります。

![](img/hello-spring-new-project-7.png)

コンソールにて下図のうように「BUILD SUCCESSFUL」と表示される事を確認してください。

![](img/hello-spring-new-project-8.png)

## Spring Bootアプリケーションの実行

プロジェクトの中の`src/main/java`の中の`com.example.demo`の中の`Application.java`の箇所で右クリックして「Spring Bootアプリケーション」を選択します。

![](img/hello-spring-new-project-9.png)

しばらくすると下図のように「Spring」のアスキーアートが表示されればSpring Bootが起動している事が確認できます。

![](img/hello-spring-new-project-10.png)

## Spring Bootプロジェクトの構成

