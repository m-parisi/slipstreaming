mkdir D:\slipstreaming\whs2011_iso\offline

Dism /Get-WIMInfo /WimFile:D:\slipstreaming\whs2011_iso\sources\install.wim

echo "check the image name before proceeding"
pause

Dism /Mount-WIM /WimFile:D:\slipstreaming\whs2011_iso\sources\install.wim /Name:"ServerHomePremium" /MountDir:D:\slipstreaming\whs2011_iso\offline

echo "Update for Windows Server 2008 R2 x64 Edition (KB3020369)"
Dism /Image:D:\slipstreaming\whs2011_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win2008r2\windows6.1-kb3020369-x64_5393066469758e619f21731fc31ff2d109595445.msu

echo "Update for Windows Server 2008 R2 x64 Edition (KB3125574) - convenience rollup [5 years of updates]"
Dism /Image:D:\slipstreaming\whs2011_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win2008r2\windows6.1-kb3125574-v4-x64_2dafb1d203c8964239af3048b5dd4b1264cd93b9.msu

echo "2017-06 Security Monthly Quality Rollup for Windows Server 2008 R2 for x64-based Systems (KB4022719)"
Dism /Image:D:\slipstreaming\whs2011_iso\offline /Add-Package /PackagePath:D:\slipstreaming\updates_win2008r2\windows6.1-kb4022719-x64_127dc7228b2d9278db81121a92471feda59461bb.msu


Dism /Unmount-WIM /MountDir:D:\slipstreaming\whs2011_iso\offline /Commit

rmdir D:\slipstreaming\whs2011_iso\offline

echo "--------------------  RUN THIS COMMAND FROM AIK  --------------------------------"

ECHO oscdimg -u2 -m -bD:\slipstreaming\whs2011_iso\boot\etfsboot.com D:\slipstreaming\whs2011_iso\ D:\slipstreaming\WHS2011x64Updated.iso

