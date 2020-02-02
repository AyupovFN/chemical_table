require 'json'

def result_print(user_choice)
  <<~HEREDOC
    Порядковый номер: #{@chemical_table[user_choice]["number"]}
    Название: #{@chemical_table[user_choice]["name"]}
    Первооткрыватель: #{@chemical_table[user_choice]["discoverer"]} (#{@chemical_table[user_choice]["year"]} г.)
    Плотность: #{@chemical_table[user_choice]["density"]} г/см³
  HEREDOC
end

file = File.read("#{__dir__}/chemical_table.json", encoding: 'UTF-8')
@chemical_table = JSON.parse(file)
# Выводим пользователю количество элементов
puts "У нас всего элементов: #{@chemical_table.keys.size}"
puts "#{@chemical_table.keys.join(', ')}"
# Спрашиваем у пользователя, какой элемент его интересует и записываем его
puts "О каком элементе хотите узнать?"
p user_choice = gets.chomp.capitalize
# Проверка — есть ли в хэше элемент, который спросил пользователь
if @chemical_table.key?(user_choice)
  puts result_print(user_choice)
else
  puts "Извините, про такой элемент мы еще не знаем."
end

