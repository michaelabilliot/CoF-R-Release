@echo off
cd /d "%~dp0"
rem SDL2 pulls System32\d3d9.dll into the process before ref_d3d9.dll is loaded,
rem so ref_d3d9's import binds to that one and the Remix bridge client never gets a
rem look in. NvRemixLauncher32 -i injects the local d3d9.dll at process creation,
rem which lands first and wins the base-name match.
start "" "NvRemixLauncher32.exe" -w "%~dp0." -i xash3d.exe -game CryOfFear -num_edicts 8192 -heapsize 1536000 -console -nofbo -nomsaa -novid -ref d3d9 +r_nolm 1 +dx_studio_gpu_skinning 1 +dx_particles 0 +r_nocull 1
