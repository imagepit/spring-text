# Git・Github環境構築

## Gitのインストール

コマンドプロンプトを起動します。

<img src="https://www.image-pit.com/git-basic/images/setup/git-install-winget-01.png" alt="コマンドプロンプトの起動" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">コマンドプロンプトの起動</div>

次のコマンドを実行しインストールします。

_コマンドプロンプトでコマンド実行_

```cmd
winget install Git.Git
```

インストールが開始されます。

<img src="https://www.image-pit.com/git-basic/images/setup/git-install-winget-04.png" alt="Gitインストール中の画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Gitインストール中の画面</div>

インストール途中に次の画面が出たら「はい」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/git-install-winget-02.png" alt="Gitインストール時の確認画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Gitインストール時の確認画面</div>

「インストール完了が完了しました」のメッセージが出たらインストール完了です。

<img src="https://www.image-pit.com/git-basic/images/setup/git-install-winget-03.png" alt="Gitインストール完了時" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Gitインストール完了時</div>

## SourceTreeのインストール

SourceTreeはGitのGUIツールです。インストーラーを下記URLよりダウンロードしてください。

[https://www.sourcetreeapp.com](https://www.sourcetreeapp.com)

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree-download01.png" alt="Sourcetreeインストーラーのダウンロード" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Sourcetreeインストーラーのダウンロード</div>

「I agree to the...」の箇所のチェックボックスを有効にして「Download」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree-download02.png" alt="Important informationダイアログ" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Important informationダイアログ</div>

ダウンロードフォルダの中にexeファイルがあるのでそれをダブルクリックして起動します。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree-install-exe.png" alt="Sourcetreeインストーラー起動" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Sourcetreeインストーラー起動</div>

Registration画面が表示されます。「スキップ」ボタンをクリックしてください。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree03.png" alt="Registration画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Registration画面</div>

次の画面では「Mercurial」のチェックボックスを外して「次へ」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree04.png" alt="Pick tools to download and install画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Pick tools to download and install画面</div>

Preferences画面では入力欄に名前とメールアドレスを入力して「次へ」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree05.png" alt="Preferences画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Preferences画面</div>

「SSHキーを読み込みますか？」のダイアログが表示されますが「いいえ」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree06.png" alt="SSHキー読み込み確認ダイアログ" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">SSHキー読み込み確認ダイアログ</div>

次の画面が表示されます。これでSourceTreeのインストールは完了です。

<img src="https://www.image-pit.com/git-basic/images/setup/sourcetree07.png" alt="Sourcetreeインストール完了" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Sourcetreeインストール完了</div>

## Githubアカウント登録

- 下記URLにアクセスします。

[https://github.co.jp/](https://github.co.jp/)

- 「Githubに登録」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account01.png" alt="Githubトップページ" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Githubトップページ</div>

- 「Username」、「Email address」、「Password」を入力します。
- 「Verify your account」の箇所の「検証する」をクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account02.png" alt="Create your accountページ上部" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Create your accountページ上部</div>

- 質問に回答して「Create account」ボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account03.png" alt="Create your accountページ下部" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Create your accountページ下部</div>

- 下記画面が表示されると登録したメールアドレス宛に確認メールが届きます。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account08.png" alt="Githubアカウント登録確認メール画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Githubアカウント登録確認メール画面</div>

- 確認メールを受信して中身を確認し認証コード部分をコピーして「Open Github」のボタンをクリックします。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account09.png" alt="メール本文にて検証" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">メール本文にて検証</div>

- コピーしたコードをペーストします。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account10.png" alt="Githubアカウント認証コード入力画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Githubアカウント認証コード入力画面</div>

- これでGithubのアカウント登録は完了です。

<img src="https://www.image-pit.com/git-basic/images/setup/github-account101.png" alt="Githubログイン後の画面" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">Githubログイン後の画面</div>