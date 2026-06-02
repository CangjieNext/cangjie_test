/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ../../user_defined_classes
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all -p user_defined_classes %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt p.%middle %n.cj --test -o %output --test
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 2, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 0

import std.unittest.delta_util.Point2D

@Test
class T {
    @TestCase
    func equal(): Unit {
        let p1 = Point2D(3.0f64, 4.0f64)
        let p2 = Point2D(3.4f64, 4.4f64)
        @Assert(p1 == p2, delta: 0.6f64)
    }

    @TestCase
    func notEqual(): Unit {
        let p1 = Point2D(3.0f64, 4.0f64)
        let p2 = Point2D(3.4f64, 4.4f64)
        @Assert(p1 != p2, delta: 0.32f64)
    }
}
