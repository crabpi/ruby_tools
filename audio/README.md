```
sudo gem install json
sudo gem install rufus-scheduler
```

# usb声卡

安装

```
sudo apt install alsa-utils alsa-tools sox libsox-fmt-mp3 lame
```

查询

```
pi@raspberrypi:~ $ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: ALSA [bcm2835 ALSA], device 0: bcm2835 ALSA [bcm2835 ALSA]
  Subdevices: 7/7
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
card 0: ALSA [bcm2835 ALSA], device 1: bcm2835 ALSA [bcm2835 IEC958/HDMI]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Device [USB Audio Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

可以看到，USB Audio Device 的 card 为 1 ，subdevice 是 0。

如何播放

```
aplay x.wav -D plughw:1,0
```

### 附

不支持mp3，所以要用sox转：

```
sox x.mp3 x.wav
```

也可以用lame转：

```
lame --decode x.mp3 x.wav
```

```
lame --decode x.mp3 - | aplay -
```

如果你需要传音乐：

```
scp C:/mp3/juanzhulian.mp3 pi@192.168.1.109:~/mp3
```



