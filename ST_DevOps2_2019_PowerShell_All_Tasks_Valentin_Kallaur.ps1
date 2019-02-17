#1.	Вывести список всех классов WMI на локальном компьютере.

Get-WmiObject -List
Get-WmiObject -Namespace "root\cimv2" -List
Get-WmiObject -Namespace "root\default" -List

gwmi -Namespace "root\default" -List -Credential Valentin\Valentin -ComputerName Valentin 

#2.	Получить список всех пространств имён классов WMI.

Get-WmiObject -Namespace "root" -List

#3.	Получить список классов работы с принтером.

Get-WmiObject Win32_Printer* -List

gwmi -List | where {$_.name -match "printer"}

#4.	Вывести информацию об операционной системе, не менее 10 полей.

$systeminfo = Get-CimInstance -ClassName Win32_OperatingSystem
$systeminfo | fl Caption, Version, BuildType, BuildNumber, InstallDate, BootDevice, CountryCode, CurrentTimeZone, ProductType, ServicePackMajorVersion

#5.	Получить информацию о BIOS.

Get-WmiObject Win32_BIOS

#6.	Вывести свободное место на локальных дисках. На каждом и сумму.

Get-WmiObject Win32_LogicalDisk | Select-Object  -Property FreeSpace | % {$_.freespace / 1Gb}

#7.	Написать сценарий, выводящий суммарное время пингования компьютера (например 10.0.0.1) в сети.

D:\!Valik\Отчёты\PowerShell\_Labwork4\script_Task7.ps1

#8.	Создать файл-сценарий вывода списка установленных программных продуктов в виде таблицы с полями Имя и Версия.

D:\!Valik\Отчёты\PowerShell\_Labwork4\script_Task8.ps1

#9.	Выводить сообщение при каждом запуске приложения MS Word.

register-wmiEvent -query "select * from __instancecreationevent within 5 where targetinstance isa 'Win32_Process' and targetinstance.name='WINWORD.exe'" -sourceIdentifier "ProcessStarted" -Action { Write-Host "RUNNING" }



