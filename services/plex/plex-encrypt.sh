#!/bin/sh
openssl enc -aes-256-cbc -salt -in plex-preferences.xml -out plex-preferences.xml.enc
