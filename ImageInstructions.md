https://beebom.com/how-clone-raspberry-pi-sd-card-windows-linux-macos/

macOS Instructions
Backup Raspberry Pi SD Card
1. Insert the SD card in your Mac using a USB or built-in card reader. Now open a Terminal window, and enter the command diskutil list. Try to identify the device ID of your SD card. For example, mine shows up as /dev/disk3.

mac-diskutil

2. Unmount your SD card:

diskutil unmountDisk /dev/disk3
Here, replace disk3 with the name of your SD card that you identified in step 1.

3. Use the dd command to write the image to your hard disk. For example:

sudo dd if=/dev/disk3 of=~/raspbian_backup.img

Here, the if parameter (input file) specifies the file to clone. In my case, it is /dev/disk3, which is my SD card’s device name. Replace it with the device name of yours. The of parameter (output file) specifies the file name to write to. I chose raspbian_backup.img in my home directory.

Note: Be careful, and double check the parameters before executing the dd command, as entering the wrong parameters here can potentially destroy the data on your drives.

You will not see any output from the command until after the cloning is complete, and that might take a while, depending on the size of your SD card. You can then remove the SD card and use it in your Pi. Once you are ready to restore the backed up image, follow the instructions below:

Restore Raspberry Pi SD Card
1. Insert the SD card in your Mac. Open a Terminal window, and unmount it using the following command:

diskutil unmountDisk /dev/disk3
Here, replace disk3 with the name of your SD that you identified in step 1 of the previous section.

2. Use the dd command to write the image file to the SD card:

sudo dd if=~/raspbian_backup.img of=/dev/disk3
This is like the command we used to make a clone, but reversed. This time, the input file if is the backup image, while the output file of is the SD card device.

Again, verify, and double-verify the parameters here, as entering the wrong command here will cause permanent data loss.

Once the write is complete, you will see a confirmation from dd. You can then remove the card from your Mac, and insert it back in the Raspberry Pi.
