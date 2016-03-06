#!/bin/sh
openssl enc -d -aes-256-cbc -salt -in plex-preferences.xml.enc -out plex-preferences.xml
