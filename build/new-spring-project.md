# Spring Bootプロジェクトの作成

## eclipseでSpring Bootプロジェクトの作成

eclipseを起動して「ファイル -> 新規 -> その他」を選択します。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project.png)

「Spring Boot」の中の「Springスターター・プロジェクト」を選択して「次へ」をクリックします。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-1.png)

名前は「spring」にし型は「Gradle（Buildship 3.x）」を選択して「次へ」をクリックします。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-2.png)

プロジェクトの依存関係の画面は入力欄に「lombok」を入力し、開発ツールの「Lombok」にチェックをして「次へ」をクリックします。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-4.png)

次の画面は「完了」ボタンをクリックします。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-5.png)

Spring Bootのプロジェクトが作成されました。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-6.png)

プロジェクト作成直後は依存関係のダウンロードでしばらく時間がかかります。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-7.png)

コンソールにて下図のうように「BUILD SUCCESSFUL」と表示される事を確認してください。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-8.png)

## Spring Bootアプリケーションの実行

プロジェクトの中の`src/main/java`の中の`com.example.demo`の中の`Application.java`の箇所で右クリックして「Spring Bootアプリケーション」を選択します。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-9.png)

しばらくすると下図のように「Spring」のアスキーアートが表示されればSpring Bootが起動している事が確認できます。

![](https://www.image-pit.com/sboot-text/img/hello-spring-new-project-10.png)

## Spring Bootプロジェクトの構成

- Spring BootプロジェクトはGradleを利用したアプリケーションプロジェクトを作成することができる。
- Gradleだけでなくビルドツールで作成したアプリケーションプロジェクトは以下の構成になる。

![](https://www.image-pit.com/sboot-text/img/gradle-project-structure-01.png)

### Gradleプロジェクトの基本構成

No|説明
---|---
①|パッケージを作成し、アプリケーションを構成するクラスやインターフェースを配備する場所
②|アプリケーションや API から読み取る情報を定義したファイルを配備する場所<br>ファイルには XML ファイル、JSON ファイル、YAML ファイル、プロパティファイルなどがある
③|JUnit を利用した単体・結合テストドライバを配備する場所
④|テストドライバで利用する外部ファイルを配備する場所
⑤|Repository から取得した API のリンクを配備される場所
⑥|プロジェクトに対する環境、API、ビルド方法などを定義するファイル

### build.gradle(ビルド定義ファイル)

- build.gradleにはコンパイルに利用するJDKのバージョンや、利用するAPIやプラグインなどの定義をGroovyまたはKotlinを利用して定義していく。

```groovy
// プロジェクト全体で利用するプラグイン機能
plugins {
	id 'org.springframework.boot' version '2.6.6'
	id 'io.spring.dependency-management' version '1.0.11.RELEASE'
	id 'java'
}
// プロジェクトグループパッケージ
group = 'com.example'
// プロジェクトバージョン
version = '0.0.1-SNAPSHOT'
// コンパイルするJDKのバージョン
sourceCompatibility = '11'
// プロジェクト設定
configurations {
	developmentOnly
    runtimeClasspath {
            extendsFrom developmentOnly
    }
	compileOnly {
		extendsFrom annotationProcessor
	}
}
// プロジェクトで利用するライブラリの入手先
repositories {
	mavenCentral()
}
// 利用するライブラリ（依存関係）
dependencies {
	implementation 'org.springframework.boot:spring-boot-starter'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

tasks.named('test') {
	useJUnitPlatform()
}
```


