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
public class Benchmark_Report_Class_01 {
    @TestCase
    func test_Xml_Report_Class_illegal(): Unit {
    }

    @Bench
    func test_Xml_Report_Class_02(): Unit {
    }
}

@Test
public class Benchmark_Report_Class_02 {
    @TestCase
    func test_Xml_Report_Class_illegal(): Unit {
    }

    @Bench
    func test_Xml_Report_Class_02(): Unit {
    }
}

main() {}
