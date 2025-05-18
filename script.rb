def caesar_cipher()
  puts "Please write a string containing characters from a-z or A-Z and spaces"
  string = gets.chomp
  puts "please give write the secret key number"
  key = gets.chomp.to_i
  puts ""

  encoded = transform_str_into_arr_of_ord(string)
  encoded = add_key_to_ord_values(encoded, key)
  encoded = transform_arr_of_ord_into_str(encoded)

  puts "The secret encoded message is: #{encoded}"
end

def transform_str_into_arr_of_ord(string)
  string.split('').reduce([]) do |arr, char|
    if char != ' ' 
      arr << char.ord
    else
      arr << char
    end
    arr
  end
end

def add_key_to_ord_values(arr, key)
  arr.reduce([]) do |sum, ord|
    if ord != ' '
      if ord > 96
        new_char = ord + key > 122 ? (ord + key) % 122 + 96 : ord + key
        sum << new_char
      else
        new_char = ord + key > 90 ? (ord + key) % 90 + 64 : ord + key
        sum << new_char
      end
      sum
    else
      sum << ord
      sum
    end
  end
end

def transform_arr_of_ord_into_str(arr)
  arr_of_str_chars = arr.reduce([]) do |sum, ord|
    if ord != ' '
      sum << ord.chr
    else
      sum << ord
    end
    sum
  end
  arr_of_str_chars.join('')
end

def check_if_letter(number)
  if (number >= 60 && number <= 90) || (number >= 97 && number <= 122)
    return true
  else
    return false
  end
end