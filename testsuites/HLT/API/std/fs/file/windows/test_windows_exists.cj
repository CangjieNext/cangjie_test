/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: mkdir dir2345
// (Windows and not OHOS)RUN-EXEC: type nul>file2345
// (Windows and not OHOS)RUN-EXEC: mklink /d link001_D dir2345
// (Windows and not OHOS)RUN-EXEC: mklink link002_F file2345
// (Windows and not OHOS)RUN-EXEC: mklink /j link003_N none2345
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)RUN-EXEC: rmdir link001_D link003_N dir2345
// (Windows and not OHOS)RUN-EXEC: del file2345 link002_F

/*
 * Test description: Test the exists() exists()
 * Test API: public static func exists(path: String): Bool
 *           public static func exists(path: Path): Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_File_Exists {
    @TestCase
    func test_symbolicLink_file(): Unit {
        @Expect(exists("link001_D"), true)
        @Expect(exists("link002_F"), true)
        @Expect(exists("link003_N"), true)
    }
}
