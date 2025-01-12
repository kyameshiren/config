import os
import time
import random

chars = '!@#$%^&*()<>?:"{}|_+-=];,./~`abcdefghijklmnopqrstuvwxyz0123456789'

while True:
    terminal_width = os.get_terminal_size().columns
    word = ''.join(random.choice(chars) for i in range(terminal_width))
    time.sleep(0.05)
    print(word)
