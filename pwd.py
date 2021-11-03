#!/usr/bin/env python3

# generates password with letters, digits and special symbols
# Author: Ricardo Vieira
# Creation date: 18/01/2021

import secrets
import string

def compliant_pwd(candidate_pwd):
    check_upper = False
    check_lower = False
    check_special_char = False
    
#    print('try --> '+candidate_pwd)
    for letter in candidate_pwd:
        if letter.isupper():
            check_upper = True
        if letter.islower():
            check_lower = True
        if letter in ('._+-'):
            check_special_char = True
    return check_lower and check_upper and check_special_char
        
password_length=20
special_characters = '._+-'
password = ''
alphabet = string.ascii_letters + string.digits + special_characters
while not compliant_pwd(password):
    password = ''.join(secrets.choice(alphabet) for i in range(password_length))
print(password)
