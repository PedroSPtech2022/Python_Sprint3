import psutil

# primeiro comando teste
temCPU = psutil.sensors_temperatures(fahrenheint=False)
print(temCPU)

# segundo bloco de comando teste
data = psutil.sensors_temperatures()
print('\n--- type ---')
print(type(data))  # dict
print('--- value ---')
print(data)

core = data['coretemp']
print('\n--- type ---')
print(type(core))  # list
print('--- value ---')
print(core)

item = core[0]
print('\n--- type ---')
print(type(item))  # object shwtemp
print('--- value ---')
print(item)
print('--- fields ---')
print('label   :', item.label)
print('current :', item.current)
print('high    :', item.high)
print('critical:', item.critical)

# -------------------------------------------------

data = psutil.sensors_temperatures()

print('\n--- First ---')
print('First:', data['coretemp'][0].current)

print('\n--- for-loop ---')
for item in data['coretemp']:
    print(item.label, ':', item.current)    
