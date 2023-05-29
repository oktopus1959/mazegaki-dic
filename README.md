# mazegaki-dic
Google日本語入力で使える、漢直向けの交ぜ書き辞書です。
mecab-ipadic-2.7.0-20070801 の \*.csv から作成しています。

## ファイルの説明

### ipadic.maze.txt
ほぼフルサイズの交ぜ書き辞書です。エントリ数は 671,223 です。

以下の手順で Google日本語入力用の辞書を作成してください。

1. 「Google日本語入力辞書ツール」を開き、「管理」> 「新規辞書にインポート...」をクリック<br/>
![image](https://github.com/oktopus1959/mazegaki-dic/assets/69497430/e413b5d1-2a5f-4224-8b5f-aa7a148fa54b)

2. 「ファイル」、「辞書名」を入力して「インポート」をクリック<br/>
![image](https://github.com/oktopus1959/mazegaki-dic/assets/69497430/d5d812d7-7a77-46c9-97da-8c92cc795c52)

3. 以下のようなダイアログが出らた「OK」をクリック<br/>
![image](https://github.com/oktopus1959/mazegaki-dic/assets/69497430/162827f3-ddff-4aa4-a659-879e1564432f)

4. 以下のような感じで辞書が作成されます<br/>
![image](https://github.com/oktopus1959/mazegaki-dic/assets/69497430/1155ce1d-4672-45c1-82bc-b39735c971d6)


エントリの一例:
```
迅速    迅速    名詞形動    じんそく -- BASE
迅そく  迅速    名詞形動    じんそく
じん速  迅速    名詞形動    じんそく

六分儀  六分儀  名詞    ろくぶんぎ -- BASE
六分ぎ  六分儀  名詞    ろくぶんぎ
ろく分ぎ    六分儀  名詞    ろくぶんぎ
六ぶんぎ    六分儀  名詞    ろくぶんぎ
ろく分儀    六分儀  名詞    ろくぶんぎ
六ぶん儀    六分儀  名詞    ろくぶんぎ
ろくぶん儀  六分儀  名詞    ろくぶんぎ
```

「よみ」と「単語」が一致しているエントリには「コメント」に ` -- BASE` と付加してあります。そこから次の `BASE` までが交ぜ書き展開されたエントリとなります。

### ipadic.maze.slim500.txt
`ipadic.maze.txt` から漢字頻度表の上位500文字について、交ぜ書き展開を削除したものになります。エントリ数は 340,305 です。
ある程度漢直入力に自信のある方はこちらを使うとよいでしょう。

### kanji-hindo.all.txt
3500字あまりの漢字を頻度順に並べたもの。元ネタは文化庁の「[漢字出現頻度数調査について](https://www.bunka.go.jp/seisaku/bunkashingikai/kokugo/nihongokyoiku_hyojun_wg/04/pdf/91934501_08.pdf)」です。

1行に100文字ずつ並んでいます。

### drop_easy_entry.rb
漢字ファイルを用いて、 `ipadic.maze.txt` からエントリを削除するための ruby スクリプト。

以下は `ipadic.maze.slim500.txt` を作成したときのコマンドラインです。

```
$ head -n 5 kanji-hindo.all.txt | ruby drop_easy_entry.rb > ipadic.maze.slim500.txt
```

`kanji-hindo.all.txt` のかわりに自分で容易に打てる漢字を集めたファイルを用いてもかまいません。自分なりの交ぜ書きライフを満喫ください！
