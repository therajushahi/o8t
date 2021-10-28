#!/usr/bin/python

import socket
import time
import sys
from datetime import datetime

#Variables
now = datetime.now()
date_time = now.strftime("%m/%d/%Y, %H:%M:%S")
ip = "54.169.113.99"
port = 5000
retry = 5
delay = 10
timeout = 3

def isOpen(ip, port):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(timeout)
        try:
                s.connect((ip, int(port)))
                s.shutdown(socket.SHUT_RDWR)
                return True
        except:
                return False
        finally:
                s.close()

def checkHost(ip, port):
        ipup = False
        for i in range(retry):
                if isOpen(ip, port):
                        ipup = True
                        break
                else:
                        time.sleep(delay)
        return ipup
file_object = open('/var/log/web-app/logs.txt', 'a')

if checkHost(ip, port):

        print (ip + " is UP", file = sys.stderr)
        log_to_write_up = ip + " is UP", "date and time:",date_time
        file_object.write(str(log_to_write_up)+ '\n')
else:
    print (ip + " is DOWN", file = sys.stderr)
    log_to_write_down = ip + " is DOWN", "date and time:",date_time
    file_object.write(str(log_to_write_down)+ '\n')

file_object.close()
