import mmap

with open('example.txt') as f:
    s = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
    if s.find('prevent_destroy') != -1:
        newvar = s.__getattribute__
        print(newvar)
        print('true')
    else: print('false')

