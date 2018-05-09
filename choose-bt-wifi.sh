#!/bin/bash

echo bt/wifi vendor choices are:
echo 1. MediaTek
echo 2. Broadcom
echo 
echo -n Which would you like? [1]
read answer
case "${answer}" in
	""|1)
	echo -n Using MediaTek bt/wifi...
	sed -i 's/^BOARD_BT_VENDOR :=.*$/BOARD_BT_VENDOR := mediatek/' device/hisilicon/poplar/{BoardConfig,device}.mk
	sed -i 's/^BOARD_WIFI_VENDOR :=.*$/BOARD_WIFI_VENDOR := mediatek/' device/hisilicon/poplar/{BoardConfig,device}.mk
	echo \ done.
	;;
	2)
	echo -n Using Broadcom bt/wifi...
	sed -i 's/^BOARD_BT_VENDOR :=.*$/BOARD_BT_VENDOR := broadcom/' device/hisilicon/poplar/{BoardConfig,device}.mk
	sed -i 's/^BOARD_WIFI_VENDOR :=.*$/BOARD_WIFI_VENDOR := broadcom/' device/hisilicon/poplar/{BoardConfig,device}.mk
	echo \ done.
	;;
	*)
	echo Error choice.
	;;
esac
