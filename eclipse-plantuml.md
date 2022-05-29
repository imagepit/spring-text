# eclipseにUML関連プラグインインストール

## UML関連プラグインのインストール

「ヘルプ」から「Eclipseマーケットプレース」を選択します。

![](https://www.evernote.com/l/AB14fiHPmyBPV4enBUyxUhQKAxPv3VyorL0B/image.png)

検索蘭に「plantuml」を入力してエンターキーを押すと、「PrantUML plugin」が表示されますのでそれの「インストール」ボタンをクリックします。

![](https://www.evernote.com/l/AB0U0IrlVrNBW4oyZNmnUepm1GM8yWmnWxoB/image.png)

「同意します」をクリックして「完了」ボタンをクリックします。

![](https://www.evernote.com/l/AB1GXwLaNrhAWoQaOIEjzg3-EAG5jl8oBU4B/image.png)

「インストール」ボタンをクリックします。

![](https://www.evernote.com/l/AB0NwnwYH1FG9YnRsDh2-I8XJHnzv1n-paEB/image.png)

再起動確認の画面では「いいえ」をクリックしてください。
（もう一つプラグインをインストールしてから再起動します。）

![](https://www.evernote.com/l/AB2eVn9LmKFMnZGt1rHAxB_irYAYe2qSlksB/image.png)

再度「Eclipseマーケットプレース」画面を表示させ「asciidoctor」で検索して「Asciidoctor editor」をインストールします。

![](https://www.evernote.com/l/AB3p8K-MGCFHEKHIz_UBqPoFnkIkFSyMTrYB/image.png)

「同意」部分をクリックして「完了」ボタンをクリックします。

![](https://www.evernote.com/l/AB23SJLYRs9A6amPdsmr4GcUuCvl12Q9yNwB/image.png)

証明書のチェックボックスをチェックして「選択を受け入れる」ボタンをクリックします。

![](https://www.evernote.com/l/AB3BZrkllUlGbqVtON-YXlkAlYXc1C7X-zYB/image.png)

「今すぐ再起動」ボタンをクリックして再起動してください。

![](https://www.evernote.com/l/AB37ZgEP1z5IjIsn_XjH0fmxGxhLnU-mmioB/image.png)

eclipseを再起動したら再度マーケットプレースを表示してインストールされている事を確認してください。

![](https://www.evernote.com/l/AB2chKAJtv5MroRTYOYP60yUBLw6STTtJO8B/image.png)

## Graphvizのインストール

下記URLよりGraphvizをダウンロードしてください。

[Graphvizインストーラーをダウンロード](https://www.dropbox.com/s/jzj8nm1iu73g6x3/stable_windows_10_cmake_Release_x64_graphviz-install-2.47.1-win64.exe?dl=0)

ダウンロードしたgraphvizのインストーラーをダブルクリックしてインストールしてください。

![](https://www.evernote.com/l/AB2fX66l-wVLYY7TwQ2sWU7egQcU-pap_5YB/image.png)

## EclipseのPlantUMLにGraphvizの実行ファイルを設定

Eclipseの「ウィンドウ」->「設定」をクリックし「PlantUML」を選択して「Path to the dot executable of Graphviz」の欄の参照ボタンを押し「C:\Program Files\Graphviz\bin」を選択します。
選択したら「適用して閉じる」ボタンをクリックしてください。

![](https://www.evernote.com/l/AB10slqllAVFRqHP9ujnLPem_GaO29KrP9YB/image.png)