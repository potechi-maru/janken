def start
  @i = 0
  @win = 0
  @lose = 0
  puts "何本勝負？(press 1 or 3 or 5)"
  @number_of_times = gets.to_i
  if @number_of_times == 1 || @number_of_times == 3 || @number_of_times == 5
    puts "#{@number_of_times}本勝負を選びました"
    repeat
  else
    puts "1, 3, 5から選んでください"
    start
  end
end

def repeat
  if @number_of_times == 3 || @number_of_times == 5
    @number_of_times.times do
      janken
    end
    announcement
  else # number_of_times == 1
    janken
    announcement
  end
end

def janken
  @i += 1
  puts "#{@i}本目"
  puts "じゃんけん…(press g or c or p)"
  battle
end

def battle
  press = {"g" => 0, "c" => 1, "p" => 2}
  jankens = ["グー", "チョキ", "パー"]
  @cpu = rand(3) # 0..2どれかランダムに表示
  player = gets.chomp
  @player = press[player] # pressのkeyからval取得
  if player == "g" || player == "c" || player == "p"
    puts "CPU…#{jankens[@cpu]}"
    puts "あなた…#{jankens[@player]}"
    result
  else
    puts "g, c, pから選んでください"
    battle
  end
end

def result
  if  @cpu == @player
    puts "あいこで…(press g or c or p)"
    battle
  elsif (@cpu == 1) && (@player == 0) || (@cpu == 2) && (@player == 1) || (@cpu == 0) && (@player == 2)
    puts "勝ち！"
    @win += 1
    puts @results = "#{@win}勝#{@lose}敗"
  else
    puts "負け！"
    @lose += 1
    puts @results = "#{@win}勝#{@lose}敗"
  end
end

def announcement
  puts "結果"
  if @win > @lose
    puts "#{@results}であなたの勝ち"
  else
    puts "#{@results}であなたの負け"
  end
end

start

