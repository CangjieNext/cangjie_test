/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./test_xml-per-package_03.cj
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f test_xml-per-package_03.cj -o %output
// RUN-EXEC-1: %run %run_opt %output %run_utest_opt %run_args --report-format=xml-per-package --reportPath=./
// (OHOS) RUN-EXEC: grep "tests=\"5\" failures=\"1\" errors=\"1\" skipped=\"1\"" ./tests/test-userdefine.xml && grep "test_Xml_Report_Class_04_Contents_For_Test" ./tests/test-userdefine.xml && grep "test_Xml_Report_Class_02_Contents_For_Test" ./tests/test-userdefine.xml
// (not Windows and not OHOS) RUN-EXEC: grep "tests=\"5\" failures=\"1\" errors=\"1\" skipped=\"1\"" ./tests/test-userdefine.xml
// (not Windows and not OHOS) RUN-EXEC: grep "test_Xml_Report_Class_04_Contents_For_Test" ./tests/test-userdefine.xml
// (not Windows and not OHOS) RUN-EXEC-1: grep "test_Xml_Report_Class_02_Contents_For_Test" ./tests/test-userdefine.xml
// (not Windows and not OHOS) RUN-EXEC: grep "tests=\"1\" failures=\"0\" errors=\"0\" skipped=\"0\"" ./tests/test-userdefine.xml
// (Windows and not OHOS) EXEC: findstr "tests=\"5\" failures=\"1\" errors=\"1\" skipped=\"1\"" ./tests/test-userdefine.xml
// (Windows and not OHOS) EXEC: findstr "test_Xml_Report_Class_04_Contents_For_Test" ./tests/test-userdefine.xml
// (Windows and not OHOS) EXEC: findstr "test_Xml_Report_Class_05_Contents_For_Test" ./tests/test-userdefine.xml
// (Windows and not OHOS) EXEC: findstr "tests=\"1\" failures=\"0\" errors=\"0\" skipped=\"0\"" ./tests/test-userdefine.xml
// (Windows and not OHOS) EXEC-1: findstr "test_Xml_Report_Class_02_Contents_For_Test" ./tests/test-userdefine.xml

package userdefine

@Test
public class Xml_Report_Class_04 {
    @TestCase
    func test_Xml_Report_Func_01(): Unit {
    }

    @TestCase
    func test_Xml_Report_Func_02(): Unit {
        println("test_Xml_Report_Class_02_Contents_For_Test")
    }

    @TestCase
    @Skip
    func test_Xml_Report_Func_03(): Unit {
        println("test_Xml_Report_Class_03_Contents_For_Test")
    }

    @TestCase
    func test_Xml_Report_Func_04(): Unit {
        @FailExpect("test_Xml_Report_Class_04_Contents_For_Test")
    }

    @TestCase
    func test_Xml_Report_Func_05(): Unit {
        throw Exception("test_Xml_Report_Class_05_Contents_For_Test")
    }

    @Bench
    func bench_Xml_Report_Class(): Unit {
        @FailExpect("will be ignored")
    }
}

@Test
public class Xml_Report_Class_05 {
    @TestCase
    func test_Xml_Report_Func_01(): Unit {
    }
}

@Test
func Xml_Report_Func_06() {}
