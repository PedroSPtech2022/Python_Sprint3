import psutil

# segundo bloco de comando teste
data = psutil.sensors_temperatures()
print('\n--- type ---')
print(type(data))  # dict
print('--- value ---')
print(data)

# -------------------------------------------------

data = psutil.sensors_temperatures()

print('\n--- First ---')
print('First:', data['coretemp'][0].current)

print('\n--- for-loop ---')
for item in data['coretemp']:
    print(item.label, ':', item.current)    
