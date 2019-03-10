curl -o tmp.mp3 $1
sox tmp.mp3 audio.wav
aplay audio.wav -D plughw:1,0
