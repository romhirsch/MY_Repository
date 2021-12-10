import socket

server_ip="0.0.0.0"
server_port=8820
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(( server_ip , server_port ))
server_socket.listen()
print( f"Server is up and running" )
print( f"port : {server_port} bind : {server_ip}" )
(client_socket, client_address) = server_socket.accept()
print( "Client connected " )

while True:
    data = client_socket.recv( 1024 ).decode()
    print( "Client sent: " + data)
    if data=="quit":
        mesg="closing connection"
        client_socket.send(mesg.encode())
        break
    mesg="hello"
    client_socket.send(mesg.encode())
   # val = input("enter you answer:")
   # client_socket.send(val.encode())
print("close connection")
client_socket.close()
server_socket.close()
