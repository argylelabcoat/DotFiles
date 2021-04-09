#!/bin/bash

sudo cp numlock /usr/local/bin/numlock

sudo cp numlock.service /etc/systemd/system/numlock.service

sudo systemctl enable numlock.service --now
