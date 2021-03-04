# 変数・配列等の定義
hand = ['グー', 'チョキ', 'パー']
janken_game_end = false

#関数
def look_over_there_game
  direction = ['上', '下', '左', '右']
  loop do
    puts 'あっちむいて〜'
    puts '0(上)1(下)2(左)3(右)'
    my_direction = gets.to_s.chomp
    puts 'ホイ！'
    puts '------------------'
    case my_direction
    when '0', '1', '2', '3'
      my_direction = my_direction.to_i
      opponent_direction = rand(4)
      puts "あなた：#{direction[my_direction]}"
      puts "相手：#{direction[opponent_direction]}"
      puts '------------------'
      if my_direction == opponent_direction
        return true
      else
        return false
      end
    else
      puts '0,1,2,3のいずれかを入力してください。'
      puts '------------------'
    end
  end
end

# 処理
while janken_game_end == false
  puts 'じゃんけん...'
  puts '0(グー)1(チョキ)2(パー)3(戦わない)'
  my_hand = gets.to_s.chomp
  puts 'ホイ！'
  puts '------------------'
  case my_hand
  when '3'
    puts 'じゃんけんアプリを終了します。'
    puts '------------------'
    janken_game_end = true
  when '0', '1', '2'
    my_hand = my_hand.to_i
    opponent_hand = rand(3)
    puts "あなた：#{hand[my_hand]}を出しました。"
    puts "相手：#{hand[opponent_hand]}を出しました。"
    puts '------------------'
    if my_hand == opponent_hand
      puts 'あいこで...'
      puts '------------------'
      janken_game_end = false
    # じゃんけんにあなたが勝った場合
    elsif (my_hand == 0 && opponent_hand == 1) || (my_hand = 1 && opponent_hand == 2) || (my_hand == 2 && opponent_hand == 3)
      your_victory = look_over_there_game
      if your_victory == true
        puts 'あなたの勝ちです！！！'
        puts '-------END-------'
        janken_game_end = true
      else
        puts '勝敗がつかなかったので再チャレンジ！'
        puts '------------------'
      end
    # じゃんけんにあなたが負けた場合
    else
      opponent_victory = look_over_there_game
      if opponent_victory == true
        puts 'あなたの負けです......'
        puts '-------END-------'
        janken_game_end = true
      else
        puts '勝敗がつかなかったので再チャレンジ！'
        puts '------------------'
      end
    end
  else
    puts '0,1,2,3のいずれかを入力してください。'
    puts '------------------'
    janken_game_end = false
  end
end
