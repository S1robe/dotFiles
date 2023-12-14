#!/bin/bash
set -x

$(i3 exit)

# Unbind VTconsoles: might not be needed
# echo 0 > /sys/class/vtconsole/vtcon0/bind
# echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI Framebuffer
# echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Unload NVIDIA kernel modules
modprobe -r nvidia_drm nvidia_uvm nvidia_modeset nvidia

# Unload USB controler 
modprobe -r xhci_pci

# Detach GPU devices from host
# Use your GPU and HDMI Audio PCI host device
virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1

# Load vfio module
modprobe vfio-pci

