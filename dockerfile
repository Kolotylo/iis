FROM microsoft/windowsservercore 
RUN powershell -Command Add-WindowsFeature Web-Server 
RUN net user webadmin Qwerty123 /add 
RUN net localgroup Administrators webadmin /add 
RUN powershell -Command Install-windowsfeature –name web-mgmt-service 
RUN powershell -Command Reg Add HKLM\Software\Microsoft\WebManagement\Server /V EnableRemoteManagement /T REG_DWORD /D 1 -f 
RUN powershell -Command set-service wmsvc -StartupType Automatic 
CMD [ "ping", "localhost", "-t" ]
