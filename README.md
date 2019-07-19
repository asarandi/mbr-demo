# mbr demo


#### man
small 16 bit asm demo with sound and animation


#### assemble
`nasm demo.asm`


#### run in emulator
`qemu-system-x86_64 -soundhw pcspk -hda demo`

_*nfs/42 lab:_ **if** you're getting this error `Failed to lock byte 100` ; **then**

try moving the file to `/tmp` or `~/goinfre` and run from there; **fi**


#### run on real hardware
##### warning (!) you better know what you're doing
`dd if=demo of=/dev/sdX` ... boot from drive

#### references
- https://github.com/cirosantilli/x86-bare-metal-examples
- http://muruganad.com/8086/8086-assembly-language-program-to-play-sound-using-pc-speaker.html
- http://dadako.com/seijin/news/pixel-pirate-devlog-episode-1-the-3-frame-walk-cycle


#### video
- https://www.youtube.com/watch?v=wMgFaN_rFN0

