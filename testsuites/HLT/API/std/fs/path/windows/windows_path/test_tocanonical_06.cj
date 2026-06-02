/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)EXEC: mkdir dir321005a dir321005b
// (Windows and not OHOS)EXEC: type nul>test321005a.txt
// (Windows and not OHOS)EXEC: mklink /d link00076 dir321005a
// (Windows and not OHOS)EXEC: mklink /j link00077 dir321005b
// (Windows and not OHOS)EXEC: mklink link00078 test321005a.txt
// (Windows and not OHOS)EXEC: mkdir dir321005a/dir1 dir321005b/dir1 
// (Windows and not OHOS)EXEC: echo 1234>test321005a.txt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir /s/q dir321005a
// (Windows and not OHOS)EXEC: rmdir /s/q dir321005b
// (Windows and not OHOS)EXEC: del test321005a.txt
// (Windows and not OHOS)EXEC: rmdir link00076 link00077
// (Windows and not OHOS)EXEC: del link00078

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_ToCanonical_06 {
    //SymbolicLink path - source file deleted
    @TestCase
    func case1(): Unit {
        var links = ["link00076", "link00077", "link00078"]
        var sum = 0
        for (link in links) {
            try {
                var p1 = canonicalize(Path(link))
            } catch (e: FSException) {
                sum += 1
            }
        }
        @Expect(sum, 0)
    }
}
