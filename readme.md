## pacman

+ 添加中国源

1. 切换到中国的源
```shell
sudo pacman-mirrors -i -c China -m rank
```

2. 查看源是否添加成功
```shell
cat /etc/pacman.d/mirrorlist
```

3. [optional] → 添加archilinuxcn源
> ArchLinuxCN 是 Arch 中文组维护的一个软件合集，
包含了中文用户常用的 WPS Office、搜狗拼音、Google Chrome 等软件。
不过，Arch 本身和它的常见衍生版（如：Manjaro）默认都不包含这个源，因此我们需要手动来配置使用这个源。

vim /etc/pamac.conf
```
[archlinuxcn]
SigLevel = Never
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
```

## fcitx5拼音输入法框架

+ install packages
```shell
sudo pacman -S fcitx5-im             # fcitx应用组
sudo pacman -S fcitx5-chinese-addons # 中文输入法支持
sudo pacman -S fcitx5-pinyin-zhwiki  # 中文字库
sudo pacman -S fcitx5-material-color # 主题样式
```

+ edit enviroment variables to enable input method to be used in apps
edit ~/.xprofile
```shell
export INPUT_METHOD=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
```

+ 修改配置文件
如果是kde的话，用fcitx5-configtool进行配置，在输入法选项中添加拼音，并对插件进行配置。

## fonts

+ install new fonts
```shell
mkdir /usr/share/fonts/myfonts
mkfontscale
mkfontdir
fc -cache -f -v
```

+ nerd fonts
```python
Fira Code Nerd Font
JetBrans Mono Nerd Font
Cascadia Nerd Font
```

## proxy

+ ss-qt5

采用gui-config.json批量导入

+ proxychains-ng

vim /etc/proxychains.conf

```
[ProxyList]
socks5 127.0.0.1:1080
```

+ chrome

安装 SwitchyOmega 插件

设置代理为 socks5 127.0.0.1

在Import | Export 中添加 restore from online: 
[https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt](https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt)

### terminal

```
alacritty   st   compton   ranger
```

### windows manager

```
i3gaps   i3status-rust   rofi   papirus-icon-theme
feh
```

### code editor

```
nvim   code
```

### programming tools

```
qt-creator   qt5-doc
```

### tools

```
ss-qt5   proxychains-ng   simplescreenrecorder
libreoffice-fresh-zh-cn
```
