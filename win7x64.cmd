echo "create folder d:/slipstreaming/win7x64_iso/"
echo "unzip en_windows_7_professional_with_sp1_x64_dvd_u_676939.iso to folder D:/slipstreaming/win7x64_iso/ "

mkdir D:\slipstreaming\win7x64_iso\offline


Dism /Get-WIMInfo /WimFile:D:\slipstreaming\win7x64_iso\sources\install.wim

echo "check the image name before proceeding"
pause

Dism /Mount-WIM /WimFile:D:\slipstreaming\win7x64_iso\sources\install.wim /Name:"Windows 7 Professional" /MountDir:D:\slipstreaming\win7x64_iso\offline

echo "Update for Windows 7 for x64-based Systems (KB3020369)"
Dism /Image:D:\slipstreaming\win7x64_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win7x64\windows6.1-kb3020369-x64_5393066469758e619f21731fc31ff2d109595445.msu


echo "Update for Windows 7 for x64-based Systems (KB3125574) - convenience rollup for Windows 7 SP1 [5 years of updates]"
Dism /Image:D:\slipstreaming\win7x64_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win7x64\windows6.1-kb3125574-v4-x64_2dafb1d203c8964239af3048b5dd4b1264cd93b9.msu


echo "October, 2016 Security Monthly Quality Rollup for Windows 7 for x64-based Systems (KB3185330) - rollups are now incremental from October 2016 onwards"
echo "Dism /Image:D:\slipstreaming\win7x64_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win7x64\windows6.1-kb3185330-x64_8738d0ef3718b8b05659454cff898e8c4f0433d7.msu"


echo "2017-05 Security Monthly Quality Rollup for Windows 7 for x64-based Systems (KB4019264)"
echo "Dism /Image:D:\slipstreaming\win7x64_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win7x64\windows6.1-kb4019264-x64_c2d1cef74d6cb2278e3b2234c124b207d0d0540f.msu"


echo "2017-06 Security Monthly Quality Rollup for Windows 7 for x64-based Systems (KB4022719)"
Dism /Image:D:\slipstreaming\win7x64_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win7x64\windows6.1-kb4022719-x64_127dc7228b2d9278db81121a92471feda59461bb.msu



Dism /Unmount-WIM /MountDir:D:\slipstreaming\win7x64_iso\offline /Commit

rmdir D:\slipstreaming\win7x64_iso\offline

echo "--------------------  RUN THIS COMMAND FROM AIK  --------------------------------"

ECHO oscdimg -n -m -bD:\slipstreaming\win7x64_iso\boot\etfsboot.com D:\slipstreaming\win7x64_iso\ D:\slipstreaming\Windows7x64Updated.iso

