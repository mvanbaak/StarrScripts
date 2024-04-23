#!/bin/bash

jdupes_command="/usr/bin/jdupes"
exclude_dirs="-X nostr:.RecycleBin -X nostr:.trash"
include_ext="-X onlyext:mp4,mkv,avi"
output_log="/.config/jdupes.log"
source_dir="/mnt/data/media/"
destination_dir="/mnt/data/torrents/"
hash_db="/.config/jdupes_hashdb"

timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$timestamp] Duplicate search started for $source_dir and $destination_dir." >> "$output_log"
$jdupes_command $exclude_dirs $include_ext -L -r -Z -y "$hash_db" "$source_dir" "$destination_dir" >> "$output_log"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$timestamp] Duplicate search completed for $source_dir and $destination_dir." >> "$output_log"
