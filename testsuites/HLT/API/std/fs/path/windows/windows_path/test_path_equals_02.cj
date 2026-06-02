/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: mkdir specialfile321007a
// (Windows and not OHOS)EXEC: type nul>specialfile321007a/RASH.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a +s +h specialfile321007a/RASH.txt
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir /s/q specialfile321007a

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Path_Equals_02 {
    //File Permission
    @TestCase
    func case1(): Unit {
        var rel_path1 = ".\\specialfile321007a\\RASH.txt"
        var rel_path2 = ".\\specialfile321007a\\rash.txt"
        var path1 = Path(rel_path1)
        var path2 = Path(rel_path2)
        @Expect(path1 == path1, true)
        @Expect(path2 == path2, true)
        @Expect(path1 == path2, false)
    }
}
