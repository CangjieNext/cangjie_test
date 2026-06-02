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
class Test_Parent {
    var testData: Array<(String, Path)> = [
        ("/", Path("/")),
        (".", Path("")),
        ("/a/b/c", Path("/a/b")),
        ("/a/b/c/", Path("/a/b")),
        ("//a///b..b.b////c////", Path("/a/b..b.b")),
        ("//a//.b//.c.c//d.e", Path("/a/.b/.c.c")),
        ("./a/b/c", Path("./a/b")),
        ("./a/.b/c/", Path("./a/.b")),
        (".//a//.b..b.b//.c.c//d.e", Path("./a/.b..b.b/.c.c")),
        ("..//a//.b.//.c.c//d.e", Path("../a/.b./.c.c")),
        ("...a/...b...b...b/../.../.c..c..c/...d....d", Path("...a/...b...b...b/../.../.c..c..c")),
        ("..//a//.b.//.c.c//d.e/", Path("../a/.b./.c.c")),
        ("...a/...b...b...b/../.../.c..c..c/...d....d/", Path("...a/...b...b...b/../.../.c..c..c")),
        ("./a/b/c/d/../../c/e/", Path("./a/b/c/d/../../c")),
        ("c:", Path("")),
        ("c:\\", Path("")),
        ("D:\\", Path("")),
        ("c:\\a\\b\\c\\d", Path("")),
        ("c:\\\\\\a\\\\b\\c\\\\\\\\d\\\\\\", Path("")),
        ("c:\\\\\\a\\\\.b\\c...c..c\\\\\\\\d.\\\\\\", Path("")),
        ("c:\\a\\b\\..\\b\\d", Path("")),
        (".\\a\\b..\\..c\\\\d...d\\..\\e\\", Path("")),
        ("\\\\\\\\server\\\\share\\\\a\\b\\", Path("")),
        ("a.b.c.d.", Path("")),
        ("c:/a\\b\\..\\/\\/b\\d", Path("c:/a\\b\\..\\/\\")),
        ("./a\\b\\..\\/\\/b\\d", Path("./a\\b\\..\\/\\")),
        ("/a a/b  b/c ", Path("/a a/b  b")),
        ("/a a/b  b /c ", Path("/a a/b  b "))
    ]

    @TestCase
    func test_parent() {
        for (data in testData) {
            let (str, path) = data
            @Expect(Path(str).parent, path)
        }
    }
}
