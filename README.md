# vagrant-siege-environment

負荷テストツールの[siege](https://www.joedog.org/siege-home/) と [sproxy](https://www.joedog.org/sproxy-home/) を手軽に試すためのVagrant+Chef環境です。


Vagrant、VirtualBox、ChefDKがインストールされた状態で、以下のコマンドにより仮想環境が起動します。

```
vagrant up
vagrant provision
vagrant ssh
```

## 使い方

### siege
siege の使い方は、以下のリンクを参照してください。

http://qiita.com/takachan/items/078208b66691f076fddc

siege単体では、ApacheBench 的な使い方ができます。
```
siege -c 30 -r 5 --time=10S --log=/tmp/siege.log http://sample.jp
```

### siege + sproxy
siegeとsproxyを組み合わせると、
JMeterのようにより現実の挙動に近い負荷をかけることができます。

sproxy を使いたい場合は、まずvagrant にsshログインした状態で、
以下のコマンドによりプロキシサーバを起動します。

```
sproxy -v -p9001 -o urls.txt 192.168.33.234
```

この状態で、ホストOS側のプロキシ設定を行うと、
ブラウザでアクセスしたページのURLがurl.txtに記録されるようになります。
```
アドレス: 192.168.33.234
ポート: 9001
```
http://tricky-code.net/setinfo/si02proxySetting.php

記録が終わったらプロキシ設定を解除して、
vagrantのssh環境から以下のようなコマンドで実行を行います。
```
siege -v --internet --file=urls.txt
siege -c 300 -t 10S -b -i --log=/tmp/siege.log -f urls.txt
```

