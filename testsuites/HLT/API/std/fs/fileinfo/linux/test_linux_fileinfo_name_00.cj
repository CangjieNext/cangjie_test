/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_FileInfo_Name {
    var testData: Array<(String, String)> = [
        (".", "."),
        ("./a/b/c", "c"),
        ("./a/.b/c/", "c"),
        (".//a//.b..b.b//.c.c//d.e", "d.e"),
        ("..//a//.b.//.c.c//d.e", "d.e"),
        ("...a/...b...b...b/../.../.c..c..c/...d....d", "...d....d"),
        ("..//a//.b.//.c.c//d.e/", "d.e"),
        ("...a/...b...b...b/../.../.c..c..c/...d....d/", "...d....d"),
        ("./a/b/c/d/../../c/e/", "e"),
        (".\\a\\b..\\..c\\\\d...d\\..\\e\\", ".\\a\\b..\\..c\\\\d...d\\..\\e\\"),
        ("a.b.c.d.", "a.b.c.d."),
        ("./a\\b\\..\\/\\/b\\d", "b\\d"),
        ("./a.b.c.d..e.", "a.b.c.d..e.")
    ]

    @TestCase
    func test_filename() {
        for (data in testData) {
            let (str, filename) = data
            if (exists(str) == false) {
                Directory.create(str, recursive: true)
                @Assert(exists(str), true)
                @Expect(FileInfo(str).name, filename)
                remove(str, recursive: true)
            } else {
                @Expect(FileInfo(str).name, filename)
            }
        }
    }
}
