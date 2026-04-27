Resize EBS Volume on Ubuntu EC2 Instance (Interview Reference Guide)

This README provides step-by-step commands to increase disk size in an Ubuntu EC2 instance after modifying the EBS volume from the AWS Console.


---

Step 1: Increase Volume Size from AWS Console

Path:

EC2 → Instances → Select Instance → Storage → Volume ID → Modify Volume

Example:

Old Size: 8 GB
New Size: 20 GB

Wait until volume state becomes:

optimizing → completed


---

Step 2: Connect to the Instance

ssh -i key.pem ubuntu@<public-ip>


---

Step 3: Check Current Disk Size

df -h

Disk still shows old size (expected behavior).


---

Step 4: Verify New Volume Detected by OS

lsblk

Example output:

nvme0n1     20G
└─nvme0n1p1  8G

Disk increased but partition not expanded yet.


---

Step 5: Install growpart (If Not Installed)

sudo apt update
sudo apt install cloud-guest-utils -y


---

Step 6: Expand Partition

For NVMe-based instances:

sudo growpart /dev/nvme0n1 1

For older instance types:

sudo growpart /dev/xvda 1


---

Step 7: Resize Filesystem (EXT4)

For NVMe:

sudo resize2fs /dev/nvme0n1p1

For older instances:

sudo resize2fs /dev/xvda1


---

Step 8: Verify Disk Expansion

df -h

Expected output:

/dev/nvme0n1p1   20G

Disk successfully expanded.


---

Quick Interview Summary Answer

Increase EBS volume from AWS Console → verify using lsblk → expand partition using growpart → extend filesystem using resize2fs → confirm using df -h.


---

How to Identify Filesystem Type (Important Interview Tip)

df -Th

If output shows:

TYPE = xfs   → use xfs_growfs
TYPE = ext4  → use resize2fs

Example for XFS:

sudo xfs_growfs -d /


---

Safety Best Practice (Production Environment)

Always create snapshot before resizing:

EC2 → Volumes → Actions → Create Snapshot

This ensures rollback safety if something fails.


---

Full Command Flow (One Glance Reference)

lsblk
sudo apt install cloud-guest-utils -y
sudo growpart /dev/nvme0n1 1
sudo resize2fs /dev/nvme0n1p1
df -h

Ready-to-use during interviews and production troubleshooting.