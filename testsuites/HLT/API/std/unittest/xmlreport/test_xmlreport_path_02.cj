/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_args --reportPath=./test_tmp_dir && ls ./test_tmp_dir/tests/test-default.Xml_Report_Path_Class.xml && ls ./test_tmp_dir/tests/test-default.TestCase_test_Xml_Report_Path_Func.xml
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --reportPath=./test_tmp_dir && dir ./test_tmp_dir/tests/test-default.Xml_Report_Path_Class.xml && dir ./test_tmp_dir/tests/test-default.TestCase_test_Xml_Report_Path_Func.xml

@Test
public class Xml_Report_Path_Class {
    @TestCase
    func test_Xml_Report_Path_Class(): Unit {
    }
}

@Test
public func test_Xml_Report_Path_Func(): Unit {
}
