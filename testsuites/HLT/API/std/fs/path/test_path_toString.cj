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
 * Test description: Test the Path.toString
 * Test API: public func toString(): String
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_ToString {
    private var path_string: Array<(Path, String)> = [
        (Path(""), ""),
        (Path("\0"), "\0"),
        (Path("/"), "/"),
        (Path("///a//\0...//"), "///a//\0...//"),
        (Path("\\\\.\\C:\\a\\b.."), "\\\\.\\C:\\a\\b..")
    ]

    @TestCase
    func test_toString(): Unit {
        for ((path, str) in path_string) {
            @Expect(path.toString(), str)
        }
    }
}
