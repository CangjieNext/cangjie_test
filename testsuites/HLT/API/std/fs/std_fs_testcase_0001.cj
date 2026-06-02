/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (Windows)EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (Windows)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --bench

import std.fs.*

@Test
class TestPath {
    @TestCase
    func test_absolute_or_relative(): Unit {
        var cases = [
            ("path以斜杠开头, /NewFile.txt", Path("/NewFile.txt"), true, false),
            ("path以.开头， .", Path("."), false, true),
            ("path以.开头, ../root", Path("../root"), false, true),
            ("path以斜杠开头, /", Path("/"), true, false)
        ]

        for ((brief, path, isAbsolute, isRelative) in cases) {
            expectEqual("check absolute", brief, path.isAbsolute(), isAbsolute)
            expectEqual("check relative", brief, path.isRelative(), isRelative)
        }
    }
}
