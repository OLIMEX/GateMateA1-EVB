dirtyJtag.uf2 is the binary we load on every GateMateA1-EVB,
it allows to program the board via tools like openFPGALoad

Notice! By default, on a brand-new device you don't need to perform the steps below,
they are listed just as information or in case you overwrote the pico-dirtyJtag!

If you have overwritten it, you can find the binary here to restore it.

1. To download dirtyJtag.uf2, first put RP2040 in bootloader mode:

Press and hold button RP-BOOT1, press and release RP-RST1, release button RP-BOOT1.

2. New storage device will appear. 

3. Copy-paste dirtyJtag.uf2 on the storage device, this will make the storage disappear 
and after few moments DirtyJTAG device would appear.

4. All done. Now you can use the openFPGAload.

This dirtyJtag.uf2 binary is made using pico-dirtyJtag project:

https://github.com/phdussud/pico-dirtyJtag

Which itself is made after DirtyJTAG project:

https://github.com/dirtyjtag/DirtyJTAG

This binary inherits any license by the original projects, make sure to respect
the licensing of the pico-dirtyJtag and DirtyJTAG projects.
