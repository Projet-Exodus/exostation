#!/bin/bash
set -e
# Generate maps
modular_exostation/tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/IceBoxStation/IceBoxStation.dmm"
modular_exostation/tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/MetaStation/MetaStation.dmm"
modular_exostation/tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/Mining/Lavaland.dmm"
# Move and rename files so the game understands them
cd "data/nanomaps"
mv "IceBoxStation_nanomap_z1.png" "Ice Box Station_nanomap_z1.png"
mv "IceBoxStation_nanomap_z2.png" "Ice Box Station_nanomap_z2.png"
mv "IceBoxStation_nanomap_z3.png" "Ice Box Station_nanomap_z3.png"
cd "../../"
cp "data/nanomaps/Ice Box Station_nanomap_z1.png" "modular_exostation/nanomap/nanomaps"
cp "data/nanomaps/Ice Box Station_nanomap_z2.png" "modular_exostation/nanomap/nanomaps"
cp "data/nanomaps/Ice Box Station_nanomap_z3.png" "modular_exostation/nanomap/nanomaps"
cp "data/nanomaps/MetaStation_nanomap_z1.png" "modular_exostation/nanomap/nanomaps"
cp "data/nanomaps/Lavaland_nanomap_z1.png" "modular_exostation/nanomap/nanomaps"
