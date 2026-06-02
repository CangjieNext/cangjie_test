/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_isEmpty {
    var testData: Array<(String, Bool)> = [
        ("/", false),
        (".", false),
        ("//a///b..b.b////c////", false),
        ("./a/b/c", false),
        ("c:", false),
        ("\\\\.\\D:\\", false),
        ("\\\\server\\shar.e\\a\\b", false),
        ("..//a//.b.//.c.c//d.e", false),
        (".//", false),
        ("", true),
        (" ", false),
        ("\0", false)
    ]

    @TestCase
    func test_isEmpty() {
        for (data in testData) {
            let (str, isEmpty) = data
            @Expect(Path(str).isEmpty(), isEmpty)
        }
    }
}
