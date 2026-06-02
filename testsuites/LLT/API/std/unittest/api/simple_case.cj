/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f

// ASSERT: scan-2 ----A----
// ASSERT: scan-1 ----B----

import std.unittest.*
import std.unittest.testmacro.*

main(): Unit {
    var a = UnitTestCase.create("test1") {=> println("----A----")}
    var b = UnitTestCase.create("test2") {=> println("----B----")}
    a.run()
    b.run()
    a.run()
}
