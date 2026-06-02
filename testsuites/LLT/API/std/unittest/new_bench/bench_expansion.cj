/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt  %f -o %output --debug-macro %cmp_utest_opt
// (Linux) EXEC-PIPE: cat %f.macrocall | compare %f
// (Windows) EXEC-PIPE: type %f.macrocall | compare %f
// ASSERT: regex-begin class\s+FooTest
// ASSERT: regex-after intoUnitTestCase
// ASSERT: regex-after intoBenchmark
// ASSERT: regex-after End of the Emit
// ASSERT: regex-end

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

@Test
class FooTest {
    @Bench[x in [ 1 ]]
    @TestCase
    func test1(x: Int64): Unit {
        sleep(Duration.millisecond)
    }
}
