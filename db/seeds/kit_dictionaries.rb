puts 'KIT辞書をインサートします'
words = %w(
  cirkit
  電子計算機研究会
)
introductions = %w(
  金沢工業大学初の学生ベンチャー企業で、学生主体でデジタルサイネージやウェブシステムの開発を行っています
  パソコンを使って制作活動をする部活で、主にプログラミング、コンピュータグラフィック、デスクトップミュージック、ネットワークの制作活動をしています。
)
dics = words.zip(introductions)
dics.each do |word, intro|
  dic = KitDictionary.new(word: word, introduction: intro)
  if dic.save
    puts "#{dic.word}を追加します"
  else
    puts dic.errors.full_messages
  end
end