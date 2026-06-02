/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./test_xmlreport_content_01.cj
// EXEC: %compiler %cmp_opt %cmp_utest_opt test_xmlreport_content_01.cj -o test_xmlreport_content_01.%suffix
// RUN-EXEC-1: %run %run_opt test_xmlreport_content_01.%suffix %run_utest_opt %run_args --reportFormat=xml --reportPath=./
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %output %run_utest_opt %run_args

import std.fs.*

@Test
public class Xml_Report_Paser {
    @TestCase
    func test_xml_parser() {
        var xml_contents = File.readFrom("./tests/test-default.Xml_Report_Class.xml")
        var str = String.fromUtf8(xml_contents)
        @Expect(str.contains("tests=\"4\" failures=\"1\" errors=\"0\" skipped=\"1\""))
        @Expect(str.contains("test_Xml_Report_Class_04_Contents_For_Test"))
    }
}
