# Bluetooth/WiFi

The Hoperun Poplar board supports both on-boarded Mediatek MT7688 USB combo bt/wifi module and one daughter board of Broadcom BCM4356 PCIe WiFi and UART(LSC) BT module.

User can choose one of them according to following:

```
. device/hisilicon/poplar/choose-bt-wifi.sh
bt/wifi vendor choices are:
1. MediaTek
2. Broadcom

Which would you like? [1]

```

then make a clean build:
```
source build/envsetup.sh
lunch poplar-eng
make clean
make -j8
```

## Tips
Currently, Broadcom bt/wifi driver is disabled in kernel as following commit:
https://github.com/96boards-poplar/linux/commit/a10b2ecdde2f6bfcf95260eccb25d7a30a0dca43

To support Broadcom bt/wifi, you need to revert this commit first, then build a new kernel Image to replace device/hisilicon/poplar-kernel/Image.
Please refer to
https://github.com/96boards-poplar/Documentation/blob/master/android/ANDROID-Build.md#building-the-kernel
