/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (OHOS)RUN-EXEC: %run %run_opt %output %run_args --reportFormat=xml --reportPath=./test_tmp_dir && ls ./test_tmp_dir/tests/test-default.Xml_Report_Path_Class.xml &&  ls ./test_tmp_dir/tests/test-default.TestCase_test_Xml_Report_Path_Func.xml
// (not Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_args --reportFormat=xml --reportPath=`pwd`/test_tmp_dir && ls `pwd`/test_tmp_dir/tests/test-default.Xml_Report_Path_Class.xml &&  ls `pwd`/test_tmp_dir/tests/test-default.TestCase_test_Xml_Report_Path_Func.xml
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --reportFormat=xml --reportPath=%CD%/test_tmp_dir 
// (Windows and not OHOS)EXEC-PIPE: if exist test_tmp_dir (echo 子目录tests存在) else (echo 子目录tests不存在) | compare %f
// (Windows and not OHOS)ASSERT: scan 子目录tests存在

@Test
public class Xml_Report_Path_Class {
    @TestCase
    func test_Xml_Report_Path_Class(): Unit {
    }
}

@Test
public func test_Xml_Report_Path_Func(): Unit {
}
