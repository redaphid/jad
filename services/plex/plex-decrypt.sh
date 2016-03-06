#!/bin/sh
openssl enc -d -aes-256-cbc -salt -in Preferences.xml.enc -out Preferences.xml
