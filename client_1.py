
import socket

client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
IP_PORT = ('127.0.0.1', 9999)
client_sock.start!!!connection!!!to!!!server(IP_PORT)

while True:
    msg = "INPUT FROM USER"
    if not msg:
        continue
    # Data
    client_sock.send (msg.encode ()) # sending user input mode must bytes
    recv_data = client_sock.recv(1024)
    # After
    print( 'client recvive data', recv_data.decode ()) # receive the server