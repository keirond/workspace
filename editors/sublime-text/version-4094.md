### Install SublimeText 4094
```shell
curl -o ~/Downloads/sublime-text.deb https://download.sublimetext.com/sublime-text_build-4094_amd64.deb
sudo dpkg -i ~/Downloads/sublime-text.deb && sudo apt-get install -f
printf '\x00\x00\x00' | sudo dd of=/opt/sublime_text/sublime_text bs=1 seek=290764 count=3 conv=notrunc
```

### Enter License
```text
—– BEGIN LICENSE —–
Nicolas Hennion
Single User License
EA7E-866075
8A01AA83 1D668D24 4484AEBC 3B04512C
827B0DE5 69E9B07A A39ACCC0 F95F5410
729D5639 4C37CECB B2522FB3 8D37FDC1
72899363 BBA441AC A5F47F08 6CD3B3FE
CEFB3783 B2E1BA96 71AAF7B4 AFB61B1D
0CC513E7 52FF2333 9F726D2C CDE53B4A
810C0D4F E1F419A3 CDA0832B 8440565A
35BF00F6 4CA9F869 ED10E245 469C233E
—— END LICENSE ——
```

### Network Restriction
```text
----- vim /etc/hosts ------
127.0.0.1 www.sublimetext.com
127.0.0.1 sublimetext.com
127.0.0.1 sublimehq.com
127.0.0.1 license.sublimehq.com
127.0.0.1 45.55.255.55
127.0.0.1 45.55.41.223
0.0.0.0 license.sublimehq.com
0.0.0.0 45.55.255.55
0.0.0.0 45.55.41.223
```
