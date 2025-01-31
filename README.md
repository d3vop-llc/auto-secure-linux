# Auto Secure Linux

![](.github/assets/200d1480-607d-4476-945b-4612fc915b2a.png)

`***version***` is a placeholder for versions in the format of `1.0.0` or `2.24.231`.
`***version_long***` is a placeholder for versions in the format of `v1.0.0` or `v2.24.231`. It refers to the ***tag*** for the release that contains the `.sh` file download.

## Run via 1 command

<center>

![](.github/assets/954dd18e-665e-4022-8dd0-974f2791d9cc.png)

</center>

### Using the live main branch

Using ***curl***
```bash
curl -s https://raw.githubusercontent.com/d3vop-llc/auto-secure-linux/refs/heads/main/asl.sh | bash
```

Using ***wget***
```bash
wget -qO- https://raw.githubusercontent.com/d3vop-llc/auto-secure-linux/refs/heads/main/asl.sh | bash
```

### Using a static release

Using ***curl***
```bash
curl -s https://github.com/d3vop-llc/auto-secure-linux/releases/download/***version_long***/auto-secure-linux_***version***.sh | bash
```

Using ***wget***
```bash
wget -qO- https://github.com/d3vop-llc/auto-secure-linux/releases/download/***version_long***/auto-secure-linux_***version***.sh | bash
```

## Download

Using ***GIT***
```bash
git clone https://github.com/d3vop-llc/auto-secure-linux.git
cd auto-secure-linux
sudo mv asl.sh /usr/local/bin/
chmod +x /usr/local/bin/asl.sh
cd ..
rm -rf ./auto-secure-linux
sudo ln -s /usr/local/bin/asl.sh /usr/local/bin/asl
```

And then run it by typing
```bash
asl
```
If that doesn't work, try using
```bash
/usr/local/bin/asl.sh
```

Or

Go to ***binaries*** section of ***releases***, and download the `auto-secure-linux_***version***.sh` file

## Bugs and Fixes

### Line endings

Example error:
```bash
./asl.sh: line 2: $'\r': command not found
./asl.sh: line 5: $'\r': command not found
./asl.sh: line 6: syntax error near unexpected token `$'{\r''
'/asl.sh: line 6: `update_script_from_github() {
```

#### Fix

Run:
```bash
sudo apt update && sudo apt install dos2unix -y
dos2unix asl.sh
```

If that doesn't work, use:
```bash
sed -i 's/\r$//' asl.sh
```