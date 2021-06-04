# セッション（1つのコントローラー）の利用の確認

## 動作の確認

### セッションを使ったフォーム入力・確認画面の実装

`controller`パッケージの中に`SessionController.java`のクラスを作成します。

- コントローラーの内容は[フォームの利用・確認](mvc-form.md)とほぼ同じです。
  - 違う箇所としては下図矢印の部分の`@SessionAttributes`でセッションスコープにしたいオブジェクトの属性名を指定している箇所です
    - これによりItemFormオブジェクトがセッションスコープになります

![](img/springmvc-session-01.png)

#### Viewの作成

コントローラーのハンドラメソッドに合わせてViewを作成します。

`templates`フォルダの中に`form`フォルダを作成して`form.html`を作成して入力画面を作成します。
- [フォームの利用・確認](mvc-form.md)とほぼ同じです。

![](img/springmvc-session-02.png)

`templates`フォルダの中に`complete`フォルダを作成して`form.html`を作成して入力画面を作成します。
- [フォームの利用・確認](mvc-form.md)とほぼ同じです。
  - セッション内容が保持されているか確認するために「戻る」のリンクを追加しています。

![](img/springmvc-session-03.png)

#### 動作の確認

セッションが保持されているかを確認します。
`http://localhost:8080/session/form`にアクセスしてフォームに入力します。

![](img/springmvc-session-05.png)

確認画面にて入力内容を確認して「戻る」のリンクをクリックします。

![](img/springmvc-session-06.png)

下図のようにセッションにて入力内容が残っている事を確認してください。

![](img/springmvc-session-07.png)

### 完了画面の追加（セッションの破棄）

完了画面を作り、セッションを破棄してみます。
`SessionController`に完了画面用のハンドラメソッドを追加します。
- `@PostMapping("complete")`にします。
- `SessionStatus`の引数を追加します。
  - これにより`sessionComplete`メソッドが呼べるようになり、セッションを破棄できます。

![](img/springmvc-session-04.png)

#### Viewの作成

完了画面のViewを作成します。

![](img/springmvc-session-08.png)

#### 動作確認

完了画面まで遷移した後に「戻る」リンクをクリックして入力画面にもどり、入力内容が破棄されている事を確認してください。

`http://localhost:8080/session/form`にアクセスしてフォームに入力します。

![](img/springmvc-session-05.png)

確認画面にて入力内容を確認して「送信」ボタンをクリックします。

![](img/springmvc-session-09.png)

完了画面が表示されます。

![](img/springmvc-session-10.png)

入力画面で入力内容が破棄された事を確認してください。

![](img/springmvc-session-11.png)

## 演習問題



![](img/springmvc-session-12.png)