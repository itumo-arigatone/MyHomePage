This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * 3.2.0
* System dependencies
  * docker使う

* Configuration
  * docker使う
* Database creation
  * docker使う
* Database initialization
  * コンテナ消してボリュームも消してかな？
* How to run the test suite
  * bundle exec rspec

* Deployment instructions
  * 構成考え中

wsl2でパーミッションが面倒なときは以下で一撃
```
sudo chown -R $USER:$USER .
```

byebugやbinding.pryを使用する場合
```
docker ps
docker attatch <container name>
```
上記コマンド実行後にdebuggerの仕込んであるページを表示する。 Ctrl + C で抜けるとコンテナごと終了するので注意。＊抜け方わからん

bundle exec ridgepole --config config/database.yml --file db/schemas/Schemafile --apply
bundle exec ridgepole --config config/database.yml -E test --file db/schemas/Schemafile --apply
