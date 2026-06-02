/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_utest_opt %run_args --reportFormat=xml --reportPath=./test_tmp_dir
// (OHOS)RUN-EXEC: grep "tests=\"4\" failures=\"1\" errors=\"0\" skipped=\"1\"" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml && grep "test_Xml_Report_Class_04_Contents_For_Test" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml && grep "test_Xml_Report_Class_02_Contents_For_Test" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml
// (not Windows and not OHOS)RUN-EXEC: grep "tests=\"4\" failures=\"1\" errors=\"0\" skipped=\"1\"" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml
// (not Windows and not OHOS)RUN-EXEC: grep "test_Xml_Report_Class_04_Contents_For_Test" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml
// (not Windows and not OHOS)RUN-EXEC-1: grep "test_Xml_Report_Class_02_Contents_For_Test" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml
// (Windows and not OHOS)EXEC: findstr "tests=\"4\" failures=\"1\" errors=\"0\" skipped=\"1\"" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml
// (Windows and not OHOS)EXEC: findstr "test_Xml_Report_Class_04_Contents_For_Test" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml
// (Windows and not OHOS)EXEC-1: findstr "test_Xml_Report_Class_02_Contents_For_Test" ./test_tmp_dir/tests/test-default.Xml_Report_Class.xml

@Test
public class Xml_Report_Class {
    @TestCase
    func test_Xml_Report_Class_01(): Unit {
    }

    @TestCase
    func test_Xml_Report_Class_02(): Unit {
        println("test_Xml_Report_Class_02_Contents_For_Test")
    }

    @TestCase
    @Skip
    func test_Xml_Report_Class_03(): Unit {
        println("test_Xml_Report_Class_03_Contents_For_Test")
    }

    @TestCase
    func test_Xml_Report_Class_04(): Unit {
        @FailExpect("test_Xml_Report_Class_04_Contents_For_Test")
    }
}
