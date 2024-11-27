array = ['I*', '5.22.155.0/25', '192.168.10.1', '0', '0', '14618', 'i']

# Extrage prima valoare și doar caracterul înainte de '*'
first_char = array[0].split('*')[0]

print(first_char)