#!/bin/sh
openssl enc -aes-256-cbc -salt -in Preferences.xml -out Preferences.xml.enc
