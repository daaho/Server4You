# Informationen über die Harddisk

## lsblk
~~~
zulu1102:~# lsblk

NAME    MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda       8:0    0  1.8T  0 disk
├─sda1    8:1    0    1M  0 part
├─sda2    8:2    0  512M  0 part
│ └─md0   9:0    0  511M  0 raid1 /boot
├─sda3    8:3    0    1G  0 part  [SWAP]
└─sda4    8:4    0  1.8T  0 part
  └─md1   9:1    0  1.8T  0 raid1 /
sdb       8:16   0  1.8T  0 disk
├─sdb1    8:17   0    1M  0 part
├─sdb2    8:18   0  512M  0 part
│ └─md0   9:0    0  511M  0 raid1 /boot
├─sdb3    8:19   0    1G  0 part  [SWAP]
└─sdb4    8:20   0  1.8T  0 part
  └─md1   9:1    0  1.8T  0 raid1 /
~~~
## smartctl

### smartctl /dev/sda
~~~
zulu1102:~# smartctl -a /dev/sda
smartctl 7.0 2018-12-30 r4883 [x86_64-linux-3.10.0-1062.9.1.el7.x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Toshiba 3.5" DT01ACA... Desktop HDD
Device Model:     TOSHIBA DT01ACA200
Serial Number:    X5RA40ZAS
LU WWN Device Id: 5 000039 fe2d2b259
Firmware Version: MX4OABB0
User Capacity:    2,000,398,934,016 bytes [2.00 TB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    7200 rpm
Form Factor:      3.5 inches
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   ATA8-ACS T13/1699-D revision 4
SATA Version is:  SATA 3.0, 6.0 Gb/s (current: 3.0 Gb/s)
Local Time is:    Sat Dec 28 11:00:27 2019 GMT
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x84) Offline data collection activity
                                        was suspended by an interrupting command from host.
                                        Auto Offline Data Collection: Enabled.
Self-test execution status:      (   0) The previous self-test routine completed
                                        without error or no self-test has ever
                                        been run.
Total time to complete Offline
data collection:                (14057) seconds.
Offline data collection
capabilities:                    (0x5b) SMART execute Offline immediate.
                                        Auto Offline data collection on/off support.
                                        Suspend Offline collection upon new
                                        command.
                                        Offline surface scan supported.
                                        Self-test supported.
                                        No Conveyance Self-test supported.
                                        Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                                        power-saving mode.
                                        Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                                        General Purpose Logging supported.
Short self-test routine
recommended polling time:        (   1) minutes.
Extended self-test routine
recommended polling time:        ( 235) minutes.
SCT capabilities:              (0x003d) SCT Status supported.
                                        SCT Error Recovery Control supported.
                                        SCT Feature Control supported.
                                        SCT Data Table supported.

SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000b   100   100   016    Pre-fail  Always       -       0
  2 Throughput_Performance  0x0005   140   140   054    Pre-fail  Offline      -       68
  3 Spin_Up_Time            0x0007   146   146   024    Pre-fail  Always       -       278 (Average 242)
  4 Start_Stop_Count        0x0012   100   100   000    Old_age   Always       -       12
  5 Reallocated_Sector_Ct   0x0033   100   100   005    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000b   100   100   067    Pre-fail  Always       -       0
  8 Seek_Time_Performance   0x0005   124   124   020    Pre-fail  Offline      -       33
  9 Power_On_Hours          0x0012   096   096   000    Old_age   Always       -       31294
 10 Spin_Retry_Count        0x0013   100   100   060    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       12
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       97
193 Load_Cycle_Count        0x0012   100   100   000    Old_age   Always       -       97
194 Temperature_Celsius     0x0002   139   139   000    Old_age   Always       -       43 (Min/Max 23/50)
196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0022   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0008   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x000a   200   200   000    Old_age   Always       -       0

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%     31037         -
# 2  Extended offline    Completed without error       00%     14978         -
# 3  Short offline       Completed without error       00%     12512         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.
~~~

### smartctl /dev/sdb

~~~
zulu1102:~# smartctl -a /dev/sdb
smartctl 7.0 2018-12-30 r4883 [x86_64-linux-3.10.0-1062.9.1.el7.x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Seagate Barracuda 3.5
Device Model:     ST2000DM006-2DM164
Serial Number:    Z4Z8M8X3
LU WWN Device Id: 5 000c50 0a3a877bb
Firmware Version: CC26
User Capacity:    2,000,398,934,016 bytes [2.00 TB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    7200 rpm
Form Factor:      3.5 inches
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   ACS-2, ACS-3 T13/2161-D revision 3b
SATA Version is:  SATA 3.1, 6.0 Gb/s (current: 3.0 Gb/s)
Local Time is:    Sat Dec 28 11:02:14 2019 GMT
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x82) Offline data collection activity
                                        was completed without error.
                                        Auto Offline Data Collection: Enabled.
Self-test execution status:      (   0) The previous self-test routine completed
                                        without error or no self-test has ever
                                        been run.
Total time to complete Offline
data collection:                (   80) seconds.
Offline data collection
capabilities:                    (0x7b) SMART execute Offline immediate.
                                        Auto Offline data collection on/off support.
                                        Suspend Offline collection upon new
                                        command.
                                        Offline surface scan supported.
                                        Self-test supported.
                                        Conveyance Self-test supported.
                                        Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                                        power-saving mode.
                                        Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                                        General Purpose Logging supported.
Short self-test routine
recommended polling time:        (   1) minutes.
Extended self-test routine
recommended polling time:        ( 203) minutes.
Conveyance self-test routine
recommended polling time:        (   2) minutes.
SCT capabilities:              (0x1085) SCT Status supported.

SMART Attributes Data Structure revision number: 10
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000f   114   099   006    Pre-fail  Always       -       62856144
  3 Spin_Up_Time            0x0003   096   096   000    Pre-fail  Always       -       0
  4 Start_Stop_Count        0x0032   100   100   020    Old_age   Always       -       56
  5 Reallocated_Sector_Ct   0x0033   100   100   010    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000f   071   060   030    Pre-fail  Always       -       13995957
  9 Power_On_Hours          0x0032   092   092   000    Old_age   Always       -       7422
 10 Spin_Retry_Count        0x0013   100   100   097    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   020    Old_age   Always       -       24
183 Runtime_Bad_Block       0x0032   100   100   000    Old_age   Always       -       0
184 End-to-End_Error        0x0032   100   100   099    Old_age   Always       -       0
187 Reported_Uncorrect      0x0032   100   100   000    Old_age   Always       -       0
188 Command_Timeout         0x0032   100   100   000    Old_age   Always       -       0 0 0
189 High_Fly_Writes         0x003a   077   077   000    Old_age   Always       -       23
190 Airflow_Temperature_Cel 0x0022   060   060   045    Old_age   Always       -       40 (Min/Max 24/40)
191 G-Sense_Error_Rate      0x0032   100   100   000    Old_age   Always       -       0
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       38
193 Load_Cycle_Count        0x0032   100   100   000    Old_age   Always       -       989
194 Temperature_Celsius     0x0022   040   040   000    Old_age   Always       -       40 (0 15 0 0 0)
197 Current_Pending_Sector  0x0012   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0010   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x003e   200   200   000    Old_age   Always       -       0
240 Head_Flying_Hours       0x0000   100   253   000    Old_age   Offline      -       5430h+26m+02.195s
241 Total_LBAs_Written      0x0000   100   253   000    Old_age   Offline      -       76329509674
242 Total_LBAs_Read         0x0000   100   253   000    Old_age   Offline      -       75124537278

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%      6934         -
# 2  Short offline       Completed without error       00%      5229         -
# 3  Short offline       Completed without error       00%      2249         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.
~~~

## Partitionierung

~~~
zulu1102:~# fdisk -l
WARNING: fdisk GPT support is currently new, and therefore in an experimental phase. Use at your own discretion.

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk label type: gpt
Disk identifier: 145F1994-6A92-4D65-9E3D-657D11FD94B3


#         Start          End    Size  Type            Name
 1         2048         4095      1M  BIOS boot
 2         4096      1052671    512M  Linux RAID
 3      1052672      3149823      1G  Linux swap
 4      3149824   3907028991    1.8T  Linux RAID
WARNING: fdisk GPT support is currently new, and therefore in an experimental phase. Use at your own discretion.

Disk /dev/sda: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk label type: gpt
Disk identifier: A457618E-4FEE-42B9-B172-2EDF610539F5


#         Start          End    Size  Type            Name
 1         2048         4095      1M  BIOS boot
 2         4096      1052671    512M  Linux RAID
 3      1052672      3149823      1G  Linux swap
 4      3149824   3907028991    1.8T  Linux RAID

Disk /dev/md0: 535 MB, 535822336 bytes, 1046528 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/md1: 1998.7 GB, 1998650867712 bytes, 3903614976 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
~~~

## RAID

### Übersicht
~~~
zulu1102:~# mdadm --detail --scan --verbose
ARRAY /dev/md/0 level=raid1 num-devices=2 metadata=1.2 name=zulu1102.dedicatedpanel.com:0 UUID=14cde1d1:160d5c63:020256c3:bd46796d
   devices=/dev/sda2,/dev/sdb2
ARRAY /dev/md/1 level=raid1 num-devices=2 metadata=1.2 name=zulu1102.dedicatedpanel.com:1 UUID=7ce3a24a:f55aa3c9:0ae57143:a82ddac6
   devices=/dev/sda4,/dev/sdb4
~~~

### /proc/mdstat
~~~
zulu1102:~# cat /proc/mdstat
Personalities : [raid1]
md1 : active raid1 sdb4[1] sda4[0]
      1951807488 blocks super 1.2 [2/2] [UU]
      [=>...................]  resync =  6.7% (131409024/1951807488) finish=330.8min speed=91690K/sec
      bitmap: 15/15 pages [60KB], 65536KB chunk

md0 : active raid1 sdb2[1] sda2[0]
      523264 blocks super 1.2 [2/2] [UU]
      bitmap: 0/1 pages [0KB], 65536KB chunk

unused devices: <none>
~~~

### MDMADM
~~~
zulu1102:~# mdadm --examine /dev/sda /dev/sdb
/dev/sda:
   MBR Magic : aa55
Partition[0] :   3907029167 sectors at            1 (type ee)
/dev/sdb:
   MBR Magic : aa55
Partition[0] :   3907029167 sectors at            1 (type ee)
~~~

~~~
zulu1102:~# mdadm --detail /dev/md0
/dev/md0:
           Version : 1.2
     Creation Time : Sat Dec 28 10:23:27 2019
        Raid Level : raid1
        Array Size : 523264 (511.00 MiB 535.82 MB)
     Used Dev Size : 523264 (511.00 MiB 535.82 MB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Sat Dec 28 10:48:13 2019
             State : clean
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

              Name : zulu1102.dedicatedpanel.com:0
              UUID : 14cde1d1:160d5c63:020256c3:bd46796d
            Events : 72

    Number   Major   Minor   RaidDevice State
       0       8        2        0      active sync   /dev/sda2
       1       8       18        1      active sync   /dev/sdb2
zulu1102:~# mdadm --detail /dev/md1
/dev/md1:
           Version : 1.2
     Creation Time : Sat Dec 28 10:23:14 2019
        Raid Level : raid1
        Array Size : 1951807488 (1861.39 GiB 1998.65 GB)
     Used Dev Size : 1951807488 (1861.39 GiB 1998.65 GB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Sat Dec 28 11:12:04 2019
             State : clean, resyncing
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

     Resync Status : 8% complete

              Name : zulu1102.dedicatedpanel.com:1
              UUID : 7ce3a24a:f55aa3c9:0ae57143:a82ddac6
            Events : 1155

    Number   Major   Minor   RaidDevice State
       0       8        4        0      active sync   /dev/sda4
       1       8       20        1      active sync   /dev/sdb4
~~~