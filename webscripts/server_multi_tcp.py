
import socket
import select
import subprocess
import os 
import threading
#%%
#NSAT01=10.3.200.231
MAX_MSG_LENGTH = 1024
SERVER_PORT = 8820
SERVER_IP = '0.0.0.0'
window =0
startmesseg ="""

===============================================================================
                         SPT REMOTE ACCESS 
===============================================================================

1) load test                   
2) store test                       
3) query test
4) run all
5) exit


"""
#%%

def main():
    print( "Setting up server..." )
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((SERVER_IP, SERVER_PORT))
    server_socket.listen()
    print( "Listening for clients..." )
    client_sockets = []
    while True:
        ready_to_read, ready_to_write, in_error = select.select([server_socket] + client_sockets, [], [])
        for current_socket in ready_to_read:
            if current_socket is server_socket:
                (client_socket, client_address) = current_socket.accept()
                print( "New client joined!" ,client_address)
                client_sockets.append(client_socket)
            else:
                print("New data from client")
                try:
                    data =current_socket.recv(MAX_MSG_LENGTH).decode()
                except:
                    client_sockets.remove(current_socket)
                if data == "exit":
                    print("Connection closed", )
                    current_socket.send("exit".encode())
                    client_sockets.remove(current_socket)
                    current_socket.close()
                elif data=="start":
                    current_socket.send(startmesseg.encode())
                elif data=="dir":
                     command = subprocess.Popen("dir", shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE )
                     Output,Errors = command.communicate()
                     current_socket.send(Output)
                elif data=="1":
                    #command = subprocess.Popen(f"perl {os.environ['temp']}\SPT\scripts\RunLoad.pl", shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
                     command = subprocess.Popen([r"C:\Perl64\bin\perl.exe", f"{os.environ['temp']}\SPT\scripts\RunLoad.pl"], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
                     Output,Errors = command.communicate()
                     current_socket.send(Output)
                elif data=="2":
                    #command = subprocess.Popen(f"perl {os.environ['temp']}\SPT\scripts\RunLoad.pl", shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
                     command = subprocess.Popen([r"C:\Perl64\bin\perl.exe", f"{os.environ['temp']}\SPT\scripts\spt_store_study.pl"], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
                     Output,Errors = command.communicate()
                     current_socket.send(Output)
                elif data=="3":
                    #command = subprocess.Popen(f"perl {os.environ['temp']}\SPT\scripts\RunLoad.pl", shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
                     command = subprocess.Popen([r"C:\Perl64\bin\perl.exe", f"{os.environ['temp']}\SPT\scripts\spt_query_tool.pl"], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
                     Output,Errors = command.communicate()
                     current_socket.send(Output)
                elif data=="3":
                    #command = subprocess.Popen(f"perl {os.environ['temp']}\SPT\scripts\RunLoad.pl", shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
                     command = subprocess.Popen([r"C:\Perl64\bin\perl.exe", f"{os.environ['temp']}\SPT\scripts\spt_query_tool.pl"], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
                     Output,Errors = command.communicate()
                     current_socket.send(Output)     
                else:
                    print(data)
                    current_socket.send(startmesseg.encode())
x = threading.Thread(target=main, args=())
x.start()
print("lalala")
d=55
s=3
print("dsadsd")
#main()