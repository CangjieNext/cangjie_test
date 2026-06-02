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
class Test_Normalize {
    var testData: Array<(String, String)> = [
        ("/", "\\"),
        (".", "."),
        ("", "."),
        ("/a/b/c", "\\a\\b\\c"),
        ("/a/b/c/", "\\a\\b\\c"),
        ("/a///b..b.b////c////", "\\a\\b..b.b\\c"),
        ("/a//.b//.c.c//d.e", "\\a\\.b\\.c.c\\d.e"),
        ("./a/b/c", "a\\b\\c"),
        ("./a/.b/c/", "a\\.b\\c"),
        (".//a//.b..b.b//.c.c//d.e", "a\\.b..b.b\\.c.c\\d.e"),
        ("..//a//.b.//.c.c//d.e", "..\\a\\.b.\\.c.c\\d.e"),
        ("...a/...b...b...b/../.../.c..c..c/...d....d", "...a\\...\\.c..c..c\\...d....d"),
        ("..//a//.b.//.c.c//d.e/", "..\\a\\.b.\\.c.c\\d.e"),
        ("...a/...b...b...b/../.../.c..c..c/...d....d/", "...a\\...\\.c..c..c\\...d....d"),
        ("./a/b/c/d/../../c/e/", "a\\b\\c\\e"),
        ("c:", "c:"),
        ("c:\\", "c:\\"),
        ("D:\\", "D:\\"),
        ("c:\\a\\b\\c\\d", "c:\\a\\b\\c\\d"),
        ("c:\\\\\\a\\\\b\\c\\\\\\\\d\\\\\\", "c:\\a\\b\\c\\d"),
        ("c:\\\\\\a\\\\.b\\c...c..c\\\\\\\\d.\\\\\\", "c:\\a\\.b\\c...c..c\\d."),
        ("c:\\a\\b\\..\\b\\d", "c:\\a\\b\\d"),
        (".\\a\\b..\\..c\\\\d...d\\..\\e\\", "a\\b..\\..c\\e"),
        ("\\\\\\\\server\\\\share\\\\a\\b\\", "\\\\\\\\server\\share\\a\\b"),
        ("a.b.c.d.", "a.b.c.d."),
        ("c:/a\\b\\..\\/\\/b\\d", "c:\\a\\b\\d"),
        ("./a\\b\\..\\/\\/b\\d", "a\\b\\d"),
        ("./a.b.c.d..e.", "a.b.c.d..e."),
        ("/a a/b  b/c ", "\\a a\\b  b\\c "),
        ("/a a/b  b / c ", "\\a a\\b  b \\ c "),
        ("/a/b/c/../../../../a0/b0", "\\a0\\b0"),
        ("./a/b/c/../../../../a0/b0", "..\\a0\\b0"),
        ("./././././.", "."),
        ("././././././", "."),
        ("\\\\\\\\\\\\.\\C:\\", "\\\\\\\\C:"),
        ("\\\\?\\C:", "\\\\?\\C:"),
        ("\\\\\\?\\C:", "\\\\\\?\\C:")
    ]

    @TestCase
    func test_normalize() {
        for (data in testData) {
            let (str, normalize) = data
            @Expect(Path(str).normalize().toString(), normalize)
        }
    }
}
