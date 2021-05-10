# PS1-Disc-Ripper

# What This Is
This script is used to copy the information present on original Playstation 1
discs and create valid binary files from that data for personal emulation or
archival purposes.

### Important Update
It has come to my attention through testing that this script may not produce
entirely valid dumps. I believe the .bin files produced are okay, but the
.cue/.toc file created is not. PCSX-Reloaded (PCSXR) and PCSX ReARMed seem to
handle them okay, but Mednafen throws an error and will not load the game.

# What This Isn't
This is not a piracy tool. Officially, I do not condone piracy of any kind.
Distributing copyrighted work that you do not have the righst to is a criminal
offense in most places.

# Credit Where Credit is Due
I did not originally come up with the cdrdao command to copy the data on the
disc. I simply modified it to fit my script, and added some functionality to
create a working script. If you would like to see the original script, follow
either the [Reddit](https://www.reddit.com/r/linux/comments/ju4m5/how_do_i_rip_a_ps1_cd_using_dd/)
link to the original thread or the [Pasebin](https://pastebin.com/TLJMAU9V)
for the original code.

# Finding the Disc Drive
The program requires at least 1 parameter to rip data, the location of the
compatible disc drive where the game disc is inserted. The location of the
disc drive within in the system can be done a number of ways. It is important
to note that this is not the same as the mount point of the disc or drive, but
the disc drive's device location listed in /dev/.

Ubuntu's GUI disc utility makes find the CD/DVD drive a snap. Simply load up
the program and navigate to the disc drive. It's location on the computer will
be listed next to "Device." For instance, Device  /dev/sr0 (Read-Only)
indicates that /dev/sr0 is the location of my disc drive, and is also what
would be entered as the first argument of the script.

The lsblk CLI command is also a useful tool for finding the system's disc
drive. Open a terminal and type in "lsblk" (without the quotes) to get a list
of all discs on the system. Under the TYPE section, locate a device that is
listed as "rom." The NAME that corresponds to this type will most likely be
your disc drive. The location of this drive within the system should be in the
/dev/ folder, so the full file name will be /dev/NAME.

These instructions are not perfect as every system and distro is different, but
they should be correct for a lot of situations.

# Valid Arguments
The first argument is required, but there are a few valid inputs:

help - Prints a basic help message informing the user of valid syntax for the
       script.

install - *REQUIRES SUDO* Installs the necessary dependancy (cdrdao) on the
          system.

[Disc Drive] - The location of the disc drive within the system.

The second argument is optional, as it is just the name that will be given to
the directory and files that are created by the program.

# Usage Example
./PS1-Rip.sh /dev/sr0 spyro

Will rip the data off of the disc in the /dev/sr0 device and place it in a
directory with the following structure:

        PS1-Rip.sh
        spyro
           |--spyro.bin
           |--spyro.cue
           |--spyro.toc


./PS1-Rip.sh /dev/sr0

Will rip the data off of the disc in the /dev/sr0 device and place it in a
directory with the following structure:

        PS1-Rip.sh
        PS1Rip
            |--PS1Rip.bin
            |--PS1Rip.cue
            |--PS1Rip.toc

# Warranty
I do not offer a warranty of any kind, and the software is provided as-is. I
cannot guarantee it will function in the intended way, or at all for that
matter. Use at your own discretion.

# License
This script is licensed under the Unlicense License. Information for what that 
means for how this code can be used can be found at the [Unlicense Website](https://unlicense.org/)
. As long as usage of this code fits within the parameters of the license, I
really don't care what you do with it.
