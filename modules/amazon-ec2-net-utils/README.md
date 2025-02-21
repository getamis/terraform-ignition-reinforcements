# amazon-ec2-net-utils

This module is used to help fix asymmetric routing issues on AWS EC2 instances running Flatcar OS 4152.2.0.

## Fork Information

This module is forked from the original repository at tag [`v2.5.4`.](https://github.com/amazonlinux/amazon-ec2-net-utils/tree/v2.5.4)

## Changes Made

To ensure compatibility with Flatcar OS, we made the following changes:
1. Replaced `/usr/bin` and `/usr/lib` with `/opt/bin` and `/opt/lib` respectively, as the `/usr` path is read-only on Flatcar OS.
