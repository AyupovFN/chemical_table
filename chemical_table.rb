require 'json'

file = File.read("#{__dir__}/chemical_table.json", encoding: 'UTF-8')
chemical_table = JSON.parse(file)
# Выводим пользователю количество элементов
puts "У нас всего элементов: #{chemical_table.keys.size}"
# Выводим пользователю сами элементы (ключи ассоциативного массива)
puts "#{chemical_table.keys}"
# Спрашиваем у пользователя, какой элемент его интересует и записываем его
# выбор в переменную element.
puts "О каком элементе хотите узнать?"
element = gets.chomp
# Проверка — есть ли в хэше элемент, который спросил пользователь
if chemical_table.key?(element)
  puts "Первооткрывателем этого элемента считается: #{chemical_table[element]}"
else
  puts "Извините, про такой элемент мы еще не знаем."
end
