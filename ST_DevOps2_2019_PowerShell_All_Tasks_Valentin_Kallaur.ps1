#1.	������� ������ ���� ������� WMI �� ��������� ����������.

Get-WmiObject -List
Get-WmiObject -Namespace "root\cimv2" -List
Get-WmiObject -Namespace "root\default" -List

gwmi -Namespace "root\default" -List -Credential Valentin\Valentin -ComputerName Valentin 

#2.	�������� ������ ���� ����������� ��� ������� WMI.

Get-WmiObject -Namespace "root" -List

#3.	�������� ������ ������� ������ � ���������.

Get-WmiObject Win32_Printer* -List

gwmi -List | where {$_.name -match "printer"}

#4.	������� ���������� �� ������������ �������, �� ����� 10 �����.

$systeminfo = Get-CimInstance -ClassName Win32_OperatingSystem
$systeminfo | fl Caption, Version, BuildType, BuildNumber, InstallDate, BootDevice, CountryCode, CurrentTimeZone, ProductType, ServicePackMajorVersion

#5.	�������� ���������� � BIOS.

Get-WmiObject Win32_BIOS

#6.	������� ��������� ����� �� ��������� ������. �� ������ � �����.

Get-WmiObject Win32_LogicalDisk | Select-Object  -Property FreeSpace | % {$_.freespace / 1Gb}

#7.	�������� ��������, ��������� ��������� ����� ���������� ���������� (�������� 10.0.0.1) � ����.

D:\!Valik\������\PowerShell\_Labwork4\script_Task7.ps1

#8.	������� ����-�������� ������ ������ ������������� ����������� ��������� � ���� ������� � ������ ��� � ������.

D:\!Valik\������\PowerShell\_Labwork4\script_Task8.ps1

#9.	�������� ��������� ��� ������ ������� ���������� MS Word.

register-wmiEvent -query "select * from __instancecreationevent within 5 where targetinstance isa 'Win32_Process' and targetinstance.name='WINWORD.exe'" -sourceIdentifier "ProcessStarted" -Action { Write-Host "RUNNING" }



