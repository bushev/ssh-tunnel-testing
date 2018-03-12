# ssh-tunnel-testing

Test [SSH Tunnel](https://itunes.apple.com/us/app/ssh-tunnel/id1260223542) iOS application with custom Open SSH configuration.

### Testing Open SSH configuration (with password)

> User: **root** Password: **my_password** Port: **2222**

1. Build & Run container with: `docker-compose up`.
2. Configure connection in SSH Tunnel application using Docker host IP address, it must be available from an iOS device.

### Testing Open SSH configuration (with private key)

> Port: **2222**

1. Replace `key.pub` with your public key.
2. Build & Run container with: `docker-compose up`.
3. Test SSH connection: `ssh root@localhost -p 2222 -i ~/.ssh/key`, where `~/.ssh/key` - path to a private key file.
4. Configure connection in SSH Tunnel application using private key. (use `ssh-keygen -t rsa` to create a keypair)