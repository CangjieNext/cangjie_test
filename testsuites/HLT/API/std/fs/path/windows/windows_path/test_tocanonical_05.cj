/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)EXEC: mkdir dir54321d dir54321f
// (Windows and not OHOS)EXEC: type nul>test54321d.txt
// (Windows and not OHOS)EXEC: mklink /d link00086 dir54321d
// (Windows and not OHOS)EXEC: mklink /j link00087 dir54321f
// (Windows and not OHOS)EXEC: mklink link00088 test54321d.txt
// (Windows and not OHOS)EXEC: rmdir dir54321d dir54321f
// (Windows and not OHOS)EXEC: del test54321d.txt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: del test54321d.txt
// (Windows and not OHOS)EXEC: rmdir link00086 link00087
// (Windows and not OHOS)EXEC: del link00088

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_ToCanonical_05 {
    //SymbolicLink path - source file deleted
    @TestCase
    func case1(): Unit {
        var links = ["link00086", "link00087", "link00088"]
        var sum = 0
        for (link in links) {
            try {
                var p1 = canonicalize(Path(link))
            } catch (e: FSException) {
                sum += 1
            }
        }
        @Expect(sum, 3)
    }
}
