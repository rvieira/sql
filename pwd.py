# generates password with letters, digits and special symbols
# does not guarantee that you do have all the different requisites: Upper, lower, digit AND symbol (to be added)
# Author: Ricardo Vieira
# Creation date: 18/01/2021

import secrets
import string
alphabet = string.ascii_letters + string.digits + '._-+'
password = ''.join(secrets.choice(alphabet) for i in range(20))  # for a 20-character password
print(password)
