# セッション（複数のコントローラー）の利用の確認

- セッションを複数のコントローラーで利用する場合は次の手順で実装できます。
  - 1. `@SessionScope`のBeanを定義
  - 2. セッションスコープのBeanを利用したいコントローラーで`@Autowired`で呼び出す
- 今回は複数のコントローラーで商品をカートに保持する想定でセッションスコープのBeanを利用してみます。

## セッションスコープのBeanの定義

- `com.example.demo`に`session`パッケージを作成して`ItemCart.java`ファイルを作成します。
  - DI対象にするため`@Component`をクラスの上に追加します。
  - セッションスコープにするため`@SessionScope`をクラスの上に追加します。
  - ゲッター、セッターを実装するためlombokの`@Data`をクラスの上に追加します。
  - 今回はフィールドとしてItemのリストを保持するようにしています。

_com.example.demo.session.ItemCart.java_

```java
package com.example.demo.session;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import com.example.demo.entity.Item;

import lombok.Data;

@Component
@SessionScope
@Data
public class ItemCart implements Serializable{
	private List<Item> items = new ArrayList<Item>();
}
```

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-01.png)

## 1つ目のコントローラーの作成

- 次にセッションスコープのBeanを呼び出し、商品を追加するコントローラー`Cart1Controller.java`を作成します。
  - `http://localhost:8080/cart1`でアクセスできるように`@RequestMapping("cart1")`を指定しています。
  - セッションスコープの`ItemCart`をフィールドとして定義し`@Autowired`でインジェクションしています。
  - 商品をカートに追加する`buy`メソッドを実装します。
    - 商品(Item)インスタンスを生成し、ItemCartに追加しています。

_com.example.demo.controler.Cart1Controller.java_

```java
package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Item;
import com.example.demo.session.ItemCart;

@Controller
@RequestMapping("cart1")
public class Cart1Controller {
	// セッションカート
	@Autowired private ItemCart cart;
	@GetMapping
	public String buy(Model model) {
		// 商品インスタンス生成
		Item item = new Item();
		item.setId(1);
		item.setName("テスト商品");
		item.setPrice(1000);
		// カートセッションに商品を追加
		cart.getItems().add(item);
		// カートセッションをModelにセット
		model.addAttribute("cart", cart);
		return "session/cart1";
	}
}
```

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-02.png)

- 次にViewを作成します。
  - tableタグ内のtrタグにて`th:if`と`th:each`を使ってItemCartのitemsフィールドのArrayListに要素があればテーブル表示させるように実装しています。
    - `th:if`の箇所ではItemCartのitemsフィールドの要素が空かどうかを条件分岐しています。
      - 空の場合は「カートの中に商品が選択されていません」を出力するようにしています。
    - `th:each`の箇所ではItemCartのitemsフィールドの要素が空でない場合に繰り返し処理で要素のItemインスタンスをテーブル行を出力するようにしています。

_src/main/resources/templates/session/cart1.html_

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>複数コントローラーでセッションを共有</title>
</head>
<body>
	<h1>複数コントローラーでセッションを共有 画面1</h1>
	<h2>商品カートにアイテムを追加しました</h2>
	<h3>カートの中身</h3>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>名前</th>
			<th>価格</th>
		</tr>
		<tr th:if="${!#lists.isEmpty(cart.items)}" th:each="item : ${cart.items}">
			<td th:text="${item.id}"></td>
			<td th:text="${item.name}"></td>
			<td th:text="${item.price}"></td>
		</tr>
		<tr th:if="${#lists.isEmpty(cart.items)}">
			<td>カートの中に商品は選択されていません</td>
		</tr>
	</table>
	<a href="cart2">次のコントローラーに移動</a>
</body>
</html>
```

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-03.png)

## 2つ目のコントローラーの作成

- セッションスコープのBeanを呼び出し、商品を表示する新しいコントローラー`Cart2Controller.java`を作成します。
  - `http://localhost:8080/cart2`でアクセスできるように`@RequestMapping("cart2")`を指定しています。
  - セッションスコープの`ItemCart`をフィールドとして定義し`@Autowired`でインジェクションしています。
  - 商品をカートの中身を表示する`cart2`メソッドを実装します。
    - 商品(Item)インスタンスを生成し、ItemCartに追加しています。
  - 商品をカートの中身を空にする`clear`メソッドを実装します。
    - ItemCartインスタンスのitemsをゲッターで呼び出し、ArrayListのclearメソッドを利用して要素を空にしています。

_com.example.demo.controler.Cart2Controller.java_

```java
package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.session.ItemCart;

@Controller
@RequestMapping("cart2")
public class Cart2Controller {
	@Autowired private ItemCart cart;
	@GetMapping
	public String cart2(Model model) {
		model.addAttribute("cart", cart);
		return "session/cart2";
	}
	@GetMapping("clear")
	public String clear() {
		cart.getItems().clear();
		return "redirect:/cart2";
	}
}
```

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-04.png)

- このコントローラーのViewを作成します。
  - このViewも先ほどとほぼ同様で、カートの中身をからにするためのリンクを追加しています。

_src/main/resources/templates/session/cart2.html_

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>複数コントローラーでセッションを共有</title>
</head>
<body>
	<h1>複数コントローラーでセッションを共有 画面2</h1>
	<h2>商品カートにアイテムを追加しました</h2>
	<h3>カートの中身</h3>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>名前</th>
			<th>価格</th>
		</tr>
		<tr th:if="${!#lists.isEmpty(cart.items)}" th:each="item : ${cart.items}">
			<td th:text="${item.id}"></td>
			<td th:text="${item.name}"></td>
			<td th:text="${item.price}"></td>
		</tr>
		<tr th:if="${#lists.isEmpty(cart.items)}">
			<td colspan="3">カートの中に商品は選択されていません</td>
		</tr>
	</table>
	<a href="/cart2/clear">セッションを破棄する</a><br>
	<a href="cart1">画面1に戻る</a>
</body>
</html>
```

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-05.png)

## 動作確認

- `http://localhost:8080/cart1`にアクセスすると次のように商品がカートに追加されます。
- この画面から「次のコントローラーに移動」をクリックします。

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-06.png)

- `http://localhost:8080/cart2`に遷移して別のコントローラーでも前のコントローラーで保存した内容が保持されて参照できることが確認できます。
- この画面から「セッションのを破棄する」をクリックします。

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-07.png)

- 次のようにセッションの商品のArrayListの要素が空になり「カートの中には商品は選択されていません」と表示されます。

![](https://www.image-pit.com/sboot-text/img/session-multi-controller-08.png)



