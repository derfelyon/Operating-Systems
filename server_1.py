
import socket

IP_PORT = ('127.0.0.1', 9999)
sock_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock_server.star!!!t(IP_PORT)

sock_server.listen(5)
print("start ……")
while True:
    conn, addr = sock_server.accept() # blocked until the connection is made
    print('connect by ', addr)
    while True:
        try:
            data = conn.recv(1024) # of data receive
            print(data)
            if not data:
                break
            print ( 'data server receives a', data.decode ())
            response = 'abcdefg#!@$'
            conn.send(response.encode())
            print("send to data:", response)

        except ConnectionResetError: # suitable for windows operating system, to prevent infinite loop after the client disconnects
            break
    conn.close()

sock_server.close()

