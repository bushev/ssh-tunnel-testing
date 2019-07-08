# How to generate keys

### ED25519 (recommended)

```
# PEM (with passphrase)
ssh-keygen -t ed25519 -f ./id_pem_ed25519 -C "yury@example.com" -N "my_passphrase"

# OpenSSH (with passphrase)
ssh-keygen -o -t ed25519 -f ./id_openssh_ed25519 -C "yury@example.com" -N "my_passphrase"

# PEM (passphraseless)
ssh-keygen -t ed25519 -f ./id_pem_passphraseless_ed25519 -C "yury@example.com" -N ""

# OpenSSH (passphraseless)
ssh-keygen -o -t ed25519 -f ./id_openssh_passphraseless_ed25519 -C "yury@example.com" -N ""
```

### RSA

``` 
# PEM (with passphrase)
ssh-keygen -t rsa -b 4096 -f ./id_pem_rsa -C "yury@example.com" -N "my_passphrase"

# OpenSSH (with passphrase)
ssh-keygen -o -t rsa -b 4096 -f ./id_openssh_rsa -C "yury@example.com" -N "my_passphrase"

# PEM (passphraseless)
ssh-keygen -t rsa -b 4096 -f ./id_pem_passphraseless_rsa -C "yury@example.com" -N ""

# OpenSSH (passphraseless)
ssh-keygen -o -t rsa -b 4096 -f ./id_openssh_passphraseless_rsa -C "yury@example.com" -N ""
```

### ECDSA

``` 
# PEM (with passphrase)
ssh-keygen -t ecdsa -f ./id_pem_ecdsa -C "yury@example.com" -N "my_passphrase"

# OpenSSH (with passphrase)
ssh-keygen -o -t ecdsa -f ./id_openssh_ecdsa -C "yury@example.com" -N "my_passphrase"

# PEM (passphraseless)
ssh-keygen -t ecdsa -f ./id_pem_passphraseless_ecdsa -C "yury@example.com" -N ""

# OpenSSH (passphraseless)
ssh-keygen -o -t ecdsa -f ./id_openssh_passphraseless_ecdsa -C "yury@example.com" -N ""
```

### DSA (NOT RECOMMENDED)

``` 
# PEM (with passphrase)
ssh-keygen -t dsa -f ./id_pem_dsa -C "yury@example.com" -N "my_passphrase"

# OpenSSH (with passphrase)
ssh-keygen -o -t dsa -f ./id_openssh_dsa -C "yury@example.com" -N "my_passphrase"

# PEM (passphraseless)
ssh-keygen -t dsa -f ./id_pem_passphraseless_dsa -C "yury@example.com" -N ""

# OpenSSH (passphraseless)
ssh-keygen -o -t dsa -f ./id_openssh_passphraseless_dsa -C "yury@example.com" -N ""
```