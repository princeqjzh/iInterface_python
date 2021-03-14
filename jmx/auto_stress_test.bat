@echo off

rem 1. 需要在系统变量中定义jmeter根目录的位置，将其命名为变量 jmeter_path
rem
rem 2. Windows上需要安装sed.exe, 并将其添加到path系统变量中
rem
rem 3. 压测脚本模板中设定的压测时间应为20秒
set "jmx_template=iInterface"
set "suffix=.jmx"
set "jmx_template_filename=%jmx_template%%suffix%"
set num=10

echo Start auto stress test.
:auto
rem 生成对应压测线程的jmx文件
set "jmx_filename=%jmx_template%_%num%%suffix%"
set "jtl_filename=test_%num%.jtl"
set "web_report_path_name=web_%num%"

del %jmx_filename% %jtl_filename%
rd /s /q %web_report_path_name%

COPY %jmx_template_filename% %jmx_filename%
echo Generate jmx file %jmx_filename%

rem 替换并发数
rem 需要在windows系统引入 sed.exe命令，用法与linux三剑客中的sed雷同
sed -i "s/thread_num/%num%/g" %jmx_filename%

rem JMeter 静默压测
call %jmeter_path%/bin/jmeter -n -t %jmx_filename% -l %jtl_filename%
rem 生成Web压测报告
call %jmeter_path%/bin/jmeter -g %jtl_filename% -e -o %web_report_path_name%
rem 清理临时文件
del %jmx_filename% %jtl_filename%

set /a num=num+10
if %num% LEQ 30 goto auto

echo End of the auto stress test