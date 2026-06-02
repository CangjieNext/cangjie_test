/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Path.init()
 * Test API: public init(s: String)
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_Init {
    private var str_4096 = String.fromUtf8(Array<UInt8>(4095, repeat: 99))
    private var str_4097 = String.fromUtf8(Array<UInt8>(4096, repeat: 99))
    private var path_string = ["", "\0", "/", "C:\\", "%$?*''<>|", "./../.../", "/home\\c/d\\e../e", str_4096, str_4097]

    @TestCase
    func test_path_init(): Unit {
        for (str in path_string) {
            try {
                Path(str)
            } catch (e: Exception) {
                @Expect("no check", "should not throw Exception")
            }
        }
    }
}
