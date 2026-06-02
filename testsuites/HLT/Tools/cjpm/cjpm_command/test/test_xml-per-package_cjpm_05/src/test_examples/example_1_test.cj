/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a.test_examples

@Test
public class Xml_Report_Class_01 {
    @TestCase
    func test_Xml_Report_Func_01(): Unit {
        @FailExpect("test_Xml_Report_Func_01_For_Test")
    }

    @TestCase
    func test_Xml_Report_Func_02(): Unit {
        throw Exception("test_Xml_Report_Func_02_For_Test")
    }

    @TestCase
    @Skip
    func test_Xml_Report_Func_03(): Unit {
        println("test_Xml_Report_Func_03_For_Test")
    }
}