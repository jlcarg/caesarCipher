def caesar_cipher()
  puts "Please write a string containing characters from a-z or A-Z and spaces"
  string = gets.chomp
  puts "please give write the secret key number"
  key = gets.chomp.to_i
  puts ""
  # If user gives key bigger than 25, it transforms it back to a key value from 0 to 25
  key = key > 25 ? key % 25 : key

  encoded = transform_str_into_arr_of_ord(string)
  encoded = add_key_to_ord_values(encoded, key)
  encoded = transform_arr_of_ord_into_str(encoded)

  puts "The secret encoded message is: #{encoded}"
end

def transform_str_into_arr_of_ord(string)
  string.split('').reduce([]) do |arr, char|
    arr << char.ord
    arr
  end
end

def add_key_to_ord_values(arr, key)
  arr.reduce([]) do |sum, ord|
    if check_if_letter ord
      # if ord + key is bigger than z or Z, we add them and calculate modulus 
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
    sum << ord.chr
    sum
  end
  arr_of_str_chars.join('')
end

def check_if_letter(number)
  # a-z when transformed with #ord range from 97 to 122, A-Z from 65 to 90
  if (number >= 60 && number <= 90) || (number >= 97 && number <= 122)
    return true
  else
    return false
  end
end