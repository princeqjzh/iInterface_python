**接口功能自动化测试程序（Python版）**
运行环境：
- python3
- unittest, nosetests
- allure report
- git

依赖准备：
pip install nose-allure-plugin

运行命令：
nosetests -v test/weather_test.py --with-allure --logdir=allure-result