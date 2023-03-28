require "csv" 
 puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

 memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください。"
  file_name = gets.chomp
  puts "メモしたい内容を入力してください。"
  CSV.open("#{file_name}.csv", 'w',quote_char: "\x00") do |csv|
    csv << [STDIN.read]
  end
  puts ""
  puts "保存されました。"
elsif memo_type == 2
  puts "拡張子を除いたファイルを入力してください。"
  file_name = gets.chomp
  puts "編集したい内容を入力してください。"
  puts "1 → メモの内容を編集する 2 → ファイル名を変更する"
  file_edit_type = gets.to_i

  if file_edit_type == 1
    puts "1 →  前のメモに追加する 2 → 前のメモを消して上書きする"
    memo_edit_type = gets.to_i

   if memo_edit_type == 1
      puts "追加したい内容を入力してください。"
      CSV.open("#{file_name}.csv", 'a',quote_char: "\x00") do |csv|
        csv << [STDIN.read]
      end
      puts ""
      puts "追加しました。"
    elsif memo_edit_type == 2
      puts "メモしたい内容を入力してください。"
      CSV.open("#{file_name}.csv", 'w',quote_char: "\x00") do |csv|
        csv << [STDIN.read]
      end
      puts ""
      puts "上書きしました。"
    else
      puts "エラー 表示された数字を入力してください"
      return
    end

  elsif file_edit_type == 2
    puts "新しいファイル名を入力してください。"
    new_file_name = gets.chomp
    File.rename("#{file_name}.csv", "#{new_file_name}.csv")
    puts ""
    puts "完了しました。"
    puts "1 →  続けてメモの内容を変更する 2 → 終了"
    edit_continue = gets.to_i

    if edit_continue == 1
      puts "1 →  前のメモに追加する 2 → 前のメモを消して上書きする"
      memo_edit_type2 = gets.to_i

     if memo_edit_type2 == 1
        puts "追加したい内容を入力してください。"
        CSV.open("#{new_file_name}.csv", 'a',quote_char: "\x00") do |csv|
          csv << [STDIN.read]
        end
        puts ""
        puts "追加しました。"
      elsif memo_edit_type2 == 2
        puts "メモしたい内容を入力してください。"
        CSV.open("#{new_file_name}.csv", 'w',quote_char: "\x00") do |csv|
          csv << [STDIN.read]
        end
        puts ""
        puts "上書きしました。"
      else
        puts "エラー 表示された数字を入力してください"
        return
      end

    elsif edit_continue == 2
      return
    else
      puts "エラー 表示された数字を入力してください"
      return
    end

  else 
    puts "エラー 表示された数字を入力してください"
    return
  end

else
  puts "エラー 表示された数字を入力してください"
  return
end