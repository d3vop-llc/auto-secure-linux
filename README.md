# Auto Secure Linux

`***version***` is a placeholder for versions in the format of `1.0.0` or `2.24.231`.
`***version_long***` is a placeholder for versions in the format of `v1.0.0` or `v2.24.231`. It refers to the ***tag*** for the release that contains the `.sh` file download.

## Run via 1 command

<span style="color: red;">THESE COMMANDS ARE NOT WORKING AS OF 1/30/2025 TO PRESENT</span>

<span style="color: red;">Please download the latest .sh file, and run it via your command line.</span>

### Using the live main branch

Using ***curl***
```
curl -s https://raw.githubusercontent.com/d3vop-llc/auto-secure-linux/refs/heads/main/asl.sh | bash
```

Using ***wget***
```
wget -qO- https://raw.githubusercontent.com/d3vop-llc/auto-secure-linux/refs/heads/main/asl.sh | bash
```

### Using a static release

Using ***curl***
```
curl -s https://github.com/d3vop-llc/auto-secure-linux/releases/download/***version_long***/auto-secure-linux_***version***.sh | bash
```

Using ***wget***
```
wget -qO- https://github.com/d3vop-llc/auto-secure-linux/releases/download/***version_long***/auto-secure-linux_***version***.sh | bash
```

## Download

Using ***GIT***
```
git clone https://github.com/d3vop-llc/auto-secure-linux.git
cd auto-secure-linux
sudo mv asl.sh /usr/local/bin/
chmod +x /usr/local/bin/asl.sh
cd ..
rm -rf ./auto-secure-linux
sudo ln -s /usr/local/bin/asl.sh /usr/local/bin/asl
```

And then run it by typing
```
asl
```
If that doesn't work, try using
```
/usr/local/bin/asl.sh
```

Or

Go to ***binaries*** section of ***releases***, and download the `auto-secure-linux_***version***.sh` file