#!/bin/bash
set -x

$(i3 exit)

# Unload vfio module
modprobe -r vfio-pci vfio_iommu_type1 vfio_core vfio

# Attach GPU devices to host
# Use your GPU and HDMI Audio PCI host device
virsh nodedev-reattach pci_0000_01_00_0
virsh nodedev-reattach pci_0000_01_00_1


# Load AMD kernel module
#modprobe amdgpu

# Rebind framebuffer to host
# echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Load usb controler
modprobe xhci_pci

# Load NVIDIA kernel modules

modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

# Bind VTconsoles: might not be needed
# echo 1 > /sys/class/vtconsole/vtcon0/bind
# echo 1 > /sys/class/vtconsole/vtcon1/bind
