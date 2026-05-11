* **环境要求**

  * cjc

  * cjprof

  * python3

  * pexpect模块：[pexpect · PyPI](https://pypi.org/project/pexpect/)

* **用例执行**

  * 执行全量用例：

    `python3 ${HLT_PATH}/framework/main.py --test_cfg=test.cfg --test_list=testlist .`

  * 执行单个用例：

    `python3 ${HLT_PATH}/framework/main.py --test_cfg=test.cfg --test_list=testlist --verbose xxx/xxx.info`

  * 命令解读：
    * ${HLT_PATH}/framework/main.py：测试框架脚本，${HLT_PATH}为HLT测试仓目录
    * --test_cfg：cfg文件，指定测试配置文件
    * --test_list：测试用例列表
    * --verbose 测试执行可视化，跑全量用例时不建议开启
    * 测试框架的更多选项，详见[cangjie - Wiki (huawei.com)](https://codehub-y.huawei.com/MapleKernel/CangjieLang/cangjie/wiki/view/doc/695963)