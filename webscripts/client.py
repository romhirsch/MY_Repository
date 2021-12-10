import socket
import subprocess
# socket.AF_INET -  ip protocol ,  socket.SOCK_STREAM - TCP
#%% Parser
#parser = argparse.ArgumentParser(description='Philips Algotec firewall configuration tool V2.0')
#parser.add_argument('--IP', '-host_ip', required=False, type=list, choices=systemProducts, help="Nsat IP")
#args = parser.parse_args()
#server_ip = args.IP
#server_ip="127.0.0.1"
server_ip="10.3.100.43"
server_port=8820
buff=1024
count=0
my_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
my_socket.connect((server_ip, server_port))
data=""
while True:
    if data=="exit":
        break
    if count==0:
        mseg="start"
        count=count+1
    else :
        mseg=input("enter number:")
    my_socket.send(mseg.encode())
    data = my_socket.recv(buff).decode()
    print(f"{data}")

my_socket.close()
