#◆概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト

#◆開発背景
元々近隣住⺠が顧客だったが、昨年始めたInstagramから⼈気となり、全国から注⽂が来る
ようになった。
InstagramのDMやメールで通販の注⽂を受けていたが、情報管理が煩雑になってきたた
め、管理機能を含んだ通販サイトを開設しようと思い⾄った。

#◆機能(顧客側／管理者側)  
・顧客側

ログイン機能(メールアドレス、パスワードでログイン)  
ログアウト機能  
商品一覧表示機能  
商品詳細情報表示機能  
カート追加機能  
カート一覧機能  
カート編集機能  
注文機能  
会員情報編集機能  
退会機能  
配送先追加・編集機能  
注文履歴一覧表示機能  
注文履歴詳細表示機能  
 
・管理者側  

ログイン機能  
ログアウト機能  
注文履歴一覧表示機能  
注文履歴詳細表示機能  
顧客一覧表示機能  
顧客詳細情報表示機能  
新規商品登録機能(画像プレビュー可)  
商品一覧表示機能  
商品詳細情報表示機能  
商品情報変更機能(画像プレビュー可)  
顧客・商品検索機能  
ジャンル設定機能  

#◆使用言語
HTML&CSS  
Ruby  
Javascript  
フレームワーク:Ruby on rails  

#◆Gem
devise  
bootstrap  
jquery-rails  
kaminari  
refile  
refile-mini_magick  
pry-rails  
pry-byebug  
pry-doc  
font-awesome-sass  

#◆環境構築
$ git clone https://github.com/Team-Quartet/nagano_cake.git  
$ cd nagano_cake  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s  
👉 http://localhost:3000  


#◆作成者
カルテット  
金田大生(金ちゃん)  
櫻井一恵(さくちゃん)  
曽田大介(ソディ)  
山邊晃司(ベーやん)  