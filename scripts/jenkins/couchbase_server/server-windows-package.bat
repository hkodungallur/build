rem Parameters

set VERSION=%1
set BLD_NUM=%2
set BUILD_NUMBER=%VERSION%-%BLD_NUM%

set MANIFEST=%3
set LICENSE=%4
set ARCHITECTURE=%5

pushd %WORKSPACE%\couchbase\voltron

:package_win
echo ======== package =============================
ruby server-win.rb %WORKSPACE%\couchbase\install 5.10.4.0.0.1 couchbase_server %BUILD_NUMBER% %LICENSE% %ARCHITECTURE% || goto error
popd

pushd %WORKSPACE%\couchbase\voltron\nsis
set PKG_FILE_DIR=%WORKSPACE%\couchbase\install
python nsis_file_gen.py %PKG_FILE_DIR% i.nsh u.nsh
"C:\Program Files (x86)\NSIS\makensis" /DFILES_SOURCE_PATH=%PKG_FILE_DR% /DINST_LIST=i.nsh /DUNINST_LIST=u.nsh couchbase_server.nsi
popd

set PKG_SRC_DIR=%WORKSPACE%\couchbase\voltron\nsis
set PKG_SRC_NAME=couchbase-server.exe
set PKG_DEST_NAME=couchbase-server-%LICENSE%_%BUILD_NUMBER%-windows_%ARCHITECTURE%.exe

copy %PKG_SRC_DIR%\%PKG_SRC_NAME% %WORKSPACE%\%PKG_DEST_NAME%
rem 
rem echo ========== creating trigger.properties ==============
rem cd %WORKSPACE%
rem echo PLATFORM=windows> trigger.properties
rem echo INSTALLER_FILENAME=%PKG_DEST_NAME%>> trigger.properties
