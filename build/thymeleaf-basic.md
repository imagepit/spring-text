# Thymeleafの基本的な使い方

- Thymeleafの基本的な使い方についてまとめました。
- 表記中のサンプルはController側は全てController.java、View側は全てlist.htmlとしている。

## 値を表示する

- 値を表示させたいタグの属性に`th:text`を追加して属性値は`${}`の中にModel.addAttributeで指定したキー名を指定する。

_list.html_

```html
<p th:text="${id}"></p>
```

### 値を結合する

- 次のように文字列を`+`を使って連結できる。

_list.html_

```html
<p th:text="'one ' + 'two ' + 'three ' + 'id = ' + ${param.id[0]}"></p>
```

### 値を結合する(リテラル置換)

- [値を結合する](#値を結合する)、のやり方でもいいがリテラル置換というもっとシンプルな書き方も用意されている。
- `"|テキストの内容|"`で記述可能、`${}`の変数式も組み込むことができる。

_list.html_

```html
<p th:text="|one two three = ${customer.id}|"></p>
```

### HTMLタグをサニタイズしないようにする

- Thymeleafではth:textはサニタイズしてくれる。
- ただ、状況によってサニタイズしたくない場合は、th:utextを利用する。
- ただし利用する場合はXSS攻撃を理解したうえで利用すること。

_Controller.java_

```java
model.addAttribute("msg", "<h1>This is Message!!</h1><br />");
```

_list.html_

```html
<p th:utext="${msg}"></p>
```


## メッセージ式

- プロパティファイルから値を取り出して表示する。
- `${}`が変数式に対してメッセージ式は`#{}`となる。
- resourcesフォルダ配下に`messages.properties`を作成しメッセージを定義する。

_messages.properties_

```
content.title=This is title
content.message=This is message
```

- View側では以下のようにすることでアクセスができる。

_list.html_

```html
<p th:text="#{content.title}"></p>
<p th:text="#{content.message}"></p>
```

## リンク式とhref

- リンクの参照先（aタグのhref属性）やフォームのデータ送信先（formタグのaction属性）の値の指定は`@{}`で囲って指定する。
  - その場合はaタグのhref属性は`th:href`にformタグのaction属性は`th:action`にする。
  - これにより送信されたデータに合わせて遷移先を動的に変更することができる。
- Spring Securityなどを実装する場合には自動的にCSRFトークンなどを動的に挿入してくれる。

_list.html_

```html
<p><a th:href="@{'/customers/edit/' + ${param.id[0]}}">link</a></p>
```

## オブジェクト内のフィールドの値を表示する1

- customerというオブジェクトのidフィールドの値を表示する例
- 以下の場合getId()というgetterメソッドが必要

_list.html_

```html
<p th:text="${customer.id}"></p>
```

## オブジェクト内のフィールドの値を表示する2

- 上記のやり方だと、オブジェクト名が変わった時に修正が面倒になってくる。
  - そのため以下のように`th:object="${customer}"`という形でオブジェクトを宣言したタグの内部で`*{フィールド名}`とする書き方もできる。
  - この場合も、getId()、getNameというgetterメソッドが必要。

_list.html_

```html
<div th:object="${customer}">
	<p th:text="*{id}"></p>
	<p th:text="*{name}"></p>
</div>
```

## 算術演算子

- 「+」,「-」,「*」,「/」,「%」が利用可能。

_list.html_

```html
<p th:text="11 + 5"></p>
<p th:text="11 - 5"></p>
<p th:text="11 * 5"></p>
<p th:text="11 / 5"></p>
<p th:text="11 % 5"></p>
```

## 比較演算子

- 「>」,「<」,「>=」,「<=」が利用可能。ただし、< と > を使用すべきではないので、`&lt;`と`&gt;`を使用する。

_list.html_

```html
<p th:text="11 &gt; 5"></p>
<p th:text="11 &lt; 5"></p>
<p th:text="11 &gt;= 5"></p>
<p th:text="11 &lt;= 5"></p>
```


## 等価演算子

- 「==」、「!=」が利用可能。

_list.html_

```html
<p th:text="11 == 11"></p>
<p th:text="11 != 5"></p>
```

## 条件分岐

### th:if

- `th:if="条件"`でtrueとなった場合、このタグおよび内部にあるタグを表示する。
- 真偽値以外にtrueと判断されるものには以下のものがある。
  - true値
  - 0以外の数値
  - "0"、"off"、"no"といった値以外のテキスト

_list.html_

```html
<div th:if="${isEven}">
	<input type="text" />
</div>
```

### th:unless

- `th:unless="条件"`でfalseとなった場合、このタグおよび内部にあるタグを表示する。
- 真偽値以外にfalseと判断されるものには以下のものがある。
  - false値
  - null
  - 0以外の数値
  - "0"、"off"、"no"といったテキスト

_list.html_

```html
<div th:unless="${isEven}">
	<input type="text" />
</div>
```

### 多項分岐

- `th:switch`が使える。
- どこにも一致しなければ`th:case="*"`となる(javaでいうdefaultみたいなもの)。

_list.html_

```html
<div th:switch="${month}">
	<p th:case="1" th:text="|${month}月|"></p>
	<p th:case="2" th:text="|${month}月|"></p>
	<p th:case="3" th:text="|${month}月|"></p>
	<p th:case="*">対象なし</p>
</div>
```

## 繰り返し(ループ)

- `th:each="変数 : ${コレクション}"`で記述できる。
- `${コレクション}`の値を1つずつ取り出し変数に代入し、以降の処理の中で変数.フィールドの形で値へアクセスできる。
- javaでいう拡張for文のようなイメージ。

_Controller.java_

```java
List<Customer> customers = new ArrayList<Customer>();
customers.add(new Customer(1 , "Miura", "Kazuyoshi"));
customers.add(new Customer(2 , "Kitazawa", "Tsuyoshi"));
customers.add(new Customer(3 , "Hashiratani", "Tetsuji"));
model.addAttribute("customers", customers);
```

_list.html_

```html
<tr th:each="customer : ${customers}">
	<td th:text="${customer.id}"></td>
	<td th:text="${customer.lastName}"></td>
	<td th:text="${customer.firstName}"></td>
</tr>
```

- [オブジェクト内のフィールドの値を表示する2](#オブジェクト内のフィールドの値を表示する2)と組み合わせて以下のようにも記述できる。

_list.html_

```html
<tr th:each="customer : ${customers}" th:object="${customer}">
	<td th:text="*{id}">100</td>
	<td th:text="*{lastName}"></td>
	<td th:text="*{firstName}"></td>
</tr>
```

### ステータス変数

- `th:each`を利用する場合、繰り返し処理中のステータスを知るためのステータス変数というものが用意されている。
- ステータス変数を利用する場合、それ用の変数をもう1つ用意する必要がある、以下の例ではstatを追加。

_list.html_

```html
<tr th:each="customer, stat : ${customers}" th:object="${customer}">
	<td th:text="*{id}">100</td>
	<td th:text="*{lastName}"></td>
	<td th:text="*{firstName}"></td>
	<td th:text="${stat.index}"></td><!-- コレクションのindex（添字）を出力 -->
</tr>
```

- 他には以下のようなものがある。

_ステータス変数一覧_

|ステータス変数|内容|
|:--|:--|
|index|0始まりの現在の「繰り返しインデックス」|
|count|1始まりの現在の「繰り返しインデックス」|
|size|繰り返し変数の全要素数|
|current|現在の要素オブジェクト|
|even|現在の繰り返し位置が偶数の場合true|
|odd|現在の繰り返し位置が奇数の場合true|
|first|現在の繰り返し処理が最初の場合はtrue|
|last|現在の繰り返し処理が最後の場合はtrue|

## プリプロセッシング

- `__${変数}__`という形(前後をアンダースコア2つで囲む形)で宣言すると、この部分は事前に評価される。
- そのため事前に評価して値を動的に変えることができる。
- 例えば、以下のようなコードがあった場合、`${customers.get(${anyNumber})}`の期待する結果は、`${customers.get(1)}`だが実際は`${customers.get(${anyNumber})}`となり、エラーとなってしまう。

_Controller.java_

```java
List<Customer> customers = new ArrayList<Customer>();
customers.add(new Customer(1 , "Miura", "Kazuyoshi"));
customers.add(new Customer(2 , "Kitazawa", "Tsuyoshi"));
customers.add(new Customer(3 , "Hashiratani", "Tetsuji"));
model.addAttribute("customers", customers);
model.addAttribute("anyNumber", 1);
```

_list.html_

```html
<div th:object="${customers.get(${anyNumber})}"><!-- これはエラー -->
	<p th:text="*{id}"></p>
</div>
```

- このような場合`${anyNumber}`の部分を事前に評価してあげる必要がある。
- そういった場合に利用するのがプリプロセッシングである。
- 冒頭で述べた通り、これは`__${anyNumber}__`とすることで実現される。

_list.html_

```html
<div th:object="${customers.get(__${anyNumber}__)}">
	<p th:text="*{id}"></p>
</div>
```

## インライン処理

- Thymeleafでは値の表示を`th:text`で行うが、毎回`th:text`と記述するのは面倒。
- こういった場合にインライン処理が使える。
  - `th:inline="text"`とするとその内部のタグでは`th:text`は省略できて、`[[${変数}]]`でアクセスできる。

_Controller.java_

```java
List<Customer> customers = new ArrayList<Customer>();
customers.add(new Customer(1 , "Miura", "Kazuyoshi"));
customers.add(new Customer(2 , "Kitazawa", "Tsuyoshi"));
customers.add(new Customer(3 , "Hashiratani", "Tetsuji"));
model.addAttribute("customers", customers);
```

_list.html_

```html
<tr th:inline="text" th:each="customer : ${customers}">
	<td>[[${customer.id}]]</td>
	<td>[[${customer.lastName}]]</td>
	<td>[[${customer.firstName}]]</td>
</tr>
```

## Javascriptのインライン処理

- インライン処理はJavascriptの中でも利用できるが、記述方法が通常のインラインと違い以下のようにコメントアウトする形で記述する。

_list.html_

```html
<script th:inline="javascript">
	alert(/*[[&(変数)]]*/);
</script>
```

## ユーティリティオブジェクト

- Thymeleafでは標準で、よく使われるクラスのオブジェクトを「#クラス名」という定数として定義してある。
- これらを利用して変数式の中に直接記述できる。

_ユーティリティオブジェクト一覧_

|定数|クラス|
|:--|:--|
|#strings|Stringクラスのオブジェクト|
|#numbers|Numberクラスのオブジェクト|
|#bools|Booleanクラスのオブジェクト|
|#dates|Dateクラスのオブジェクト|
|#calendars|Calendarクラスのオブジェクト|
|#objects|Objectクラスのオブジェクト|
|#arrays|Arrayクラスのオブジェクト|
|#lists|Listクラスのオブジェクト|
|#maps|Mapクラスのオブジェクト|
|#sets|Setクラスのオブジェクト|

- 次はStringクラスのtoUpperCaseメソッドを使った例

_list.html_

```html
<p th:text="${#strings.toUpperCase('Hello Thymeleaf')}"></p>
```

- 次はDateクラスのformatメソッドを使った例

_list.html_

```html
<p th:text="${#dates.format(new java.util.Date(),'yyyy/MM/dd')}"></p>
```
