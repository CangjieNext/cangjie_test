/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_ExtensionName {
    var testData: Array<(String, String)> = [
        ("/a/b/c/d.a.b.c..d/", "d"),
        ("/a/b/c/.d.a.b.c..D/", "D"),
        ("./a/b/c/.d.a.b.c..d./", ""),
        ("/a/b/c/.d.a.b.c..d.", ""),
        ("c:\\a\\b\\c\\.d.a..b.c.d.", ""),
        ("\\\\.\\D:\\", ""),
        ("\\\\server\\shar.e\\a\\b", ""),
        ("\\\\\\\\\\.\\C:\\", "")
    ]

    @TestCase
    func test_extensionName() {
        for (data in testData) {
            let (str, extensionName) = data
            @Expect(Path(str).extensionName, extensionName)
        }
    }
}
