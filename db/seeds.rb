# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create!(
    email: 'nagano@com',
    password: '123456'
    )

 Customer.create!([
 	{family_name: '森川', first_name: '花子', kana_family_name: 'モリカワ', kana_first_name: 'ハナコ', postal_code: '1112222', address: '北海道十勝郡1-1', email: 'hanako@com', phone_number: '00011112222', password: '123456'},
 	{family_name: '滝山', first_name: '風太', kana_family_name: 'タキヤマ', kana_first_name: 'フウタ', postal_code: '2223333', address: '鹿児島県屋久島2-2', email: 'huta@com', phone_number: '00033334444', password: '123456'},
 	{family_name: '林田', first_name: '実', kana_family_name: 'ハヤシダ', kana_first_name: 'ミノル', postal_code: '3334444', address: '東京都西東京市3-3', email: 'minoru@com', phone_number: '00055556666', password: '123456'}
   ])

 ShippingAddress.create!([
 	{customer_id: 1, receiver_name: '森川 花子', postal_code: '1112222', address: '北海道十勝郡1-1'},
 	{customer_id: 1, receiver_name: '海野 航', postal_code: '5556666', address: '香川県高松市12-3'}
   ])


 Genre.create!([
	{name: 'ケーキ', is_active: 'true'},
	{name: 'プリン', is_active: 'true'},
	{name: '焼き菓子', is_active: 'true'},
	{name: 'キャンディー', is_active: 'false'}
    ])

 Item.create!([
 	{genre_id: 1, name: 'ピスタチオケーキ', introduction: 'スポンジにもクリームにもふんだんにピスタチオクリームを使用しました。', image: open("./db/seeds_images/item1.jpg"), non_taxed_price: 2500, is_active: true},
 	{genre_id: 3, name: '特製シュークリーム', introduction: '表面はサクサクのシュー生地に濃厚なカスタードクリームがたっぷり。', image: open("./db/seeds_images/item8.jpg"), non_taxed_price: 330, is_active: true},
  	{genre_id: 2, name: 'ラズベリーソースのプリン', introduction: 'なめらかプリンに酸味のあるラズベリーソースを合わせました。', image: open("./db/seeds_images/item7.jpg"), non_taxed_price: 400, is_active: true},
 	{genre_id: 1, name: 'ミックスベリーロールケーキ', introduction: 'ふわふわの生地に生クリームとベリーがたっぷり。', image: open("./db/seeds_images/item3.jpg"), non_taxed_price: 2700, is_active: true},
 	{genre_id: 1, name: '抹茶のミルフィーユ', introduction: '宇治抹茶を生地にもクリームにも贅沢に使用しました。', image: open("./db/seeds_images/item4.jpg"), non_taxed_price: 2600, is_active: true},
 	{genre_id: 1, name: 'ビターチョコレートケーキ', introduction: 'カカオの香りが広がるビターチョコレートのケーキです。', image: open("./db/seeds_images/item5.jpg"), non_taxed_price: 2500, is_active: true},
 	{genre_id: 4, name: 'アップルキャンディー', introduction: '可愛らしい姫りんごのキャンディーです。', image: open("./db/seeds_images/item11.jpg"), non_taxed_price: 330, is_active: true},
 	{genre_id: 1, name: 'ダブルベリータルト', introduction: '色鮮やかなダブルベリーのタルトです。', image: open("./db/seeds_images/item2.jpg"), non_taxed_price: 3000, is_active: true},
 	{genre_id: 3, name: 'ベジタブルクッキー（6枚入り）', introduction: 'ほうれん草やピーマンのバウダーを練り込んだクッキーです。', image: open("./db/seeds_images/item10.jpg"), non_taxed_price: 1200, is_active: true},
  	{genre_id: 2, name: 'なめらかプリン', introduction: 'こだわりの卵を使ったプリンです。', image: open("./db/seeds_images/item6.jpg"), non_taxed_price: 350, is_active: true},
  	{genre_id: 3, name: 'チョコレートマフィン', introduction: 'チョコレート好きにはたまらないチョコレート尽くしのマフィンです。', image: open("./db/seeds_images/item9.jpg"), non_taxed_price: 370, is_active: true},
  	{genre_id: 4, name: '塩バターキャラメル（5粒入り）', introduction: 'ほのかな塩気とバターの香りがマッチしたキャラメルです。', image: open("./db/seeds_images/item12.jpg"), non_taxed_price: 900, is_active: true}
 	])




