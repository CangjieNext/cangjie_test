/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 15, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 0

@Test
class T {
    @TestCase
    func simpleFloat16(): Unit {
        @PowerAssert(1.1f16 == 1.2f16, delta: 0.11f16)
    }

    @TestCase
    func complexFloat16(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @PowerAssert(1.1f16 + b * (c - a) - 2.0f16 == 1.3f16 * (a + a + b - c * a), delta: 0.35f16 + c * a)
    }

    @TestCase
    func simpleRelativeDeltaFloat16(): Unit {
        @PowerAssert(1.1f16 == 1.2f16, delta: RelativeDelta(absolute: 0.11f16, relative: 0.0001f16))
    }

    @TestCase
    func complexRelativeDeltaFloat16(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @PowerAssert(1.1f16 + b * (c - a) - 2.0f16 == 1.3f16 * (a + a + b - c * a),
            delta: RelativeDelta(absolute: 0.35f16 + c * a, relative: 0.0001f16))
    }

    @TestCase
    func simpleRelativeDeltaMattersFloat16(): Unit {
        @PowerAssert(65503.0004f16 == 65503.003f16, delta: RelativeDelta(absolute: 0.00001f16, relative: 0.000001f16))
    }

    @TestCase
    func simpleFloat32(): Unit {
        @PowerAssert(1.1f32 == 1.2f32, delta: 0.11f32)
    }

    @TestCase
    func complexFloat32(): Unit {
        let a = 0.002f32
        let b = 0.3f32
        let c = 3.11f32
        @PowerAssert(1.1f32 + b * (c - a) - 2.0f32 == 1.3f32 * (a + a + b - c * a), delta: 0.35f32 + c * a)
    }

    @TestCase
    func simpleRelativeDeltaFloat32(): Unit {
        @PowerAssert(1.1f32 == 1.2f32, delta: RelativeDelta(absolute: 0.11f32, relative: 0.0001f32))
    }

    @TestCase
    func complexRelativeDeltaFloat32(): Unit {
        let a = 0.002f32
        let b = 0.3f32
        let c = 3.11f32
        @PowerAssert(1.1f32 + b * (c - a) - 2.0f32 == 1.3f32 * (a + a + b - c * a),
            delta: RelativeDelta(absolute: 0.35f32 + c * a, relative: 0.0001f32))
    }

    @TestCase
    func simpleRelativeDeltaMattersFloat32(): Unit {
        @PowerAssert(65503.0004f32 == 65503.003f32, delta: RelativeDelta(absolute: 0.00001f32, relative: 0.000001f32))
    }

    @TestCase
    func simpleFloat64(): Unit {
        @PowerAssert(1.1f64 == 1.2f64, delta: 0.11f64)
    }

    @TestCase
    func complexFloat64(): Unit {
        let a = 0.002f64
        let b = 0.3f64
        let c = 3.11f64
        @PowerAssert(1.1f64 + b * (c - a) - 2.0f64 == 1.3f64 * (a + a + b - c * a), delta: 0.35f64 + c * a)
    }

    @TestCase
    func simpleRelativeDeltaFloat64(): Unit {
        @PowerAssert(1.1f64 == 1.2f64, delta: RelativeDelta(absolute: 0.11f64, relative: 0.0001f64))
    }

    @TestCase
    func complexRelativeDeltaFloat64(): Unit {
        let a = 0.002f64
        let b = 0.3f64
        let c = 3.11f64
        @PowerAssert(1.1f64 + b * (c - a) - 2.0f64 == 1.3f64 * (a + a + b - c * a),
            delta: RelativeDelta(absolute: 0.35f64 + c * a, relative: 0.0001f64))
    }

    @TestCase
    func simpleRelativeDeltaMattersFloat64(): Unit {
        @PowerAssert(65503.0004f64 == 65503.003f64, delta: RelativeDelta(absolute: 0.00001f64, relative: 0.000001f64))
    }
}
