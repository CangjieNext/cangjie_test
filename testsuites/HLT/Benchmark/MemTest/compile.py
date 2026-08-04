#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
import subprocess
import os

cases = [

("testcase_1","一个runslot内部"),
("testcase_1_1","finalizer alloc"),
("testcase_1_2","finalizer alloc global"),
("testcase_2","bulkfree-list切换"),
("testcase_3","bulkfreelist切换稳定性"),
("testcase_4","bulkfreelist切换稳定性2"),
("testcase_5","global_run内并发"),
("testcase_6","non_fullist->curr_run并发"),
("testcase_6_1","curr_run-nun_fulllist-cache_slots并发"),
("testcase_7","global->page_manger并发"),
("testcase_8","page_manger并发1page"),
("testcase_9","ExtendSpace并发1pgae"),
("testcase_10","ExtendSpace并发2page"),
("testcase_11","跨线程持有+local->global并发"),
("testcase_12","跨线程持有+local->global重复3次"),
("testcase_13","小于144字节size的OBJ并发释放"),
("testcase_14","8-2048字节obj并发释放申请"),
("testcase_15","8-2048字节obj并发申请跨线程释放"),
("testcase_16","小于144字节占obj总数80%并发申请跨线程释放"),
("testcase_17","66选6个8-2048字节OBJ+largesize选2并发申请"),
("testcase_18","66选6个8-2048字节OBJ+largesize选2并发释放"),
("testcase_19","66选6个小于144字节占总OBJ80%+largesize选2并发压测"),
("testcase_20","多线程alloc+sleep1s循环压测"),
("testcase_21","多线程alloc+sleep1s释放循环压测"),
("testcase_22","多线程分配回收并发"),
("testcase_23","每100ms分配一次连续分400ms，1.4s后退出"),
("testcase_24","66选11多线程每1ms申请alloc4k释放4k"),
("testcase_25","所有大小多线程每1ms申请alloc4k释放4k"),
("testcase_26","所有大小多线程每1ms随机申请跨线程释放"),

("thread_testcase30","多线程竞短时间争同一把锁sleep"),

("gc_test1","static_roots显示释放"),
("gc_test2","static_roots抢占释放"),
("gc_test3","string_roots全局变量"),
("gc_test4","string_roots局部变量"),
("gc_test5","stack_roots函数退出前主动triggerGC"),
("gc_test6","GC扫描与finalizer交互"),
("gc_test7","5s触发一次GC"),
("gc_test8","testNativeAttach"),
]

def compile(case:str,info:str):
    print('compiler {}!'.format(case))
    print('test {}'.format(info))
    with open('main.cj','r') as f:
        content = f.read().replace('testcase_1',case)
        with open(case + '.cj','w') as c:
            c.write(content)
    cmd = ['cjc',case + '.cj','MemAllocTestCase.cj','MemAllocUtil.cj','GcTestCase.cj','ThreadTest.cj','FinalizerAlloc.cj','-o',case]
    print(' '.join(cmd))
    p = subprocess.Popen(' '.join(cmd),shell=True)
    p.wait()
    os.remove(case+'.cj')


def clean():
    for i in cases:
        os.remove(i[0])

if __name__ == '__main__':
    if len(sys.argv) == 2 and sys.argv[1] == 'clean':
        clean()
    else:
        for i in cases:
            compile(*i)


