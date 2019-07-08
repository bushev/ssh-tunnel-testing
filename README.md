# ssh-tunnel-testing

Test [SSH Tunnel](https://itunes.apple.com/us/app/ssh-tunnel/id1260223542) iOS application with custom Open SSH configuration.

### Testing Open SSH configuration (with password)

> User: **root** Password: **my_password** Port: **2222**

1. Build & Run container with: `docker-compose up`.
2. Configure connection in SSH Tunnel application using Docker host IP address, it must be available from an iOS device.

### Testing Open SSH configuration (with private key)

> Port: **5555**

1. Replace `key.pub` with your public key.
2. Build & Run container with: `docker-compose up`.
3. Test SSH connection: `ssh root@localhost -p 2222 -i ~/.ssh/key`, where `~/.ssh/key` - path to a private key file.
4. Configure connection in SSH Tunnel application using private key. (use `ssh-keygen -t rsa` to create a keypair)

### Testing with PAM auth (Google Authenticator)

> User: **root** Password: **my_password** Port: **3333**

1. Attach to container: `docker exec -it ssh_tunnel_linux_pam /bin/bash`
2. Configure PAM (Google Authenticator) by running `google-authenticator`
3. Connect `ssh root@localhost -p 3333`


### Testing with PAM auth (YubiKey OTP)

> User: **root** Password: **my_password** Port: **4444**

1. Attach to container: `docker exec -it ssh_tunnel_linux_pam_yubikey /bin/bash`
2. Configure PAM (Yubikey OTP)  
    2.1. Install the Yubico pam library.
    ``` 
    sudo add-apt-repository ppa:yubico/stable
    sudo apt-get update
    sudo apt-get install libpam-yubico
    
    ```
    2.2. Generate an API key from Yubico using this [form](https://upgrade.yubico.com/getapikey).  
    2.3. Update your pam settings to use YubiKeys.
    ```
    sudo nano /etc/pam.d/sshd
    
    # As the first line in the file, include the following:
    auth required pam_yubico.so id=[Your Client ID] key=[Your Secret Key] debug authfile=/etc/yubikey_mappings mode=client 
    
    # Also, comment out this line:
    @include common-auth
    ```
    2.4. Edit `/etc/yubikey_mappings` file and populate it with the first 12 characters of your YubiKey's OTP and username.  
    ``` 
    # Example:
    rachel:gd3rk2osn5hs
    ```
    2.5. Update your sshd_config to authenticate via publickey and PAM.  
    ``` 
    sudo nano /etc/ssh/sshd_config
    
    # Add/Update lines:
    ChallengeResponseAuthentication yes
    AuthenticationMethods password,keyboard-interactive:pam
    UsePAM yes
    ```
    2.6 Restart service.  
    ``` 
    sudo service sshd restart
    ```
3. Connect `ssh root@localhost -p 4444`
