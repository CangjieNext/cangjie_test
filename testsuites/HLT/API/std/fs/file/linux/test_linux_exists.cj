/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not iOS and not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows or OHOS) RUN-EXEC: mkdir dir2345
// (not iOS and not Windows or OHOS) RUN-EXEC: touch file2345
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s dir2345 link001_D
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s file2345 link002_F
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s none2345 link003_N
// (not iOS and not Windows or OHOS) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (not iOS and not Windows or OHOS) RUN-EXEC: rm -rf link001_D link002_F link003_N dir2345 file2345

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
    func test_symbolicLink(): Unit {
        @Expect(exists("link001_D"), true)
        @Expect(exists("link002_F"), true)
        @Expect(exists("link003_N"), true)
    }
}
