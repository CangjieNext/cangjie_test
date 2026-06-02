/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

import std.unittest.*
import std.unittest.testmacro.*

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
}

main() {}
