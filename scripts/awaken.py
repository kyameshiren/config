import time
import random

chars = '!@#$%^&*()<>?:"{}|_+-=]\;,./~`'

while True:

	word = ''.join(random.choice(chars) for i in range(211))
	x = random.randint(0,150)
	if x != 0:
		time.sleep(0.05)
		print(word)
	else:
		print('\n bitch \n')

