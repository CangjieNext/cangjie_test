/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 4,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

import std.overflow.*
import std.unittest.*
import std.unittest.testmacro.*

/**
 * 测试头说明
 * line 1 EXEC: %compiler %cmp_opt %f --test -o %output
 * 编译指令，增加--test选项
 * line 2 EXEC-PIPE-NUM: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
 * 执行测试用例并比较结果，test的返回值是 失败用例数量 + 错误用例数量
 * line 3-4 ASSERT:regex-begin
 * 对测试结果进行比较，通过个数，跳过，错误和失败
 *
 * 测试用例说明
 * 测试接口：
 * public func checkedPow(y: UInt64): Option<Int64>
 * public func throwingPow(y: UInt64): Int64
 * public func saturatingPow(y: UInt64): Int64
 * public func wrappingPow(y: UInt64): Int64
 * 功能分析：
 * 测试当底数是1或-1时，结果是否正确
 */
@Test
public class Test_pow {
    @TestCase
    func case_checkedPow_int64(): Unit {
        let x1: Int64 = 1
        let x2: Int64 = -1
        let x3: Int64 = 0
        let x4: Int64 = 2
        let y1: UInt64 = UInt64(0)
        let y2: UInt64 = UInt64(1)
        let y3: UInt64 = UInt64(2)
        @Expect(1, x1.checkedPow(y1))
        @Expect(1, x1.checkedPow(y2))
        @Expect(1, x1.checkedPow(y3))

        @Expect(1, x2.checkedPow(y1))
        @Expect(-1, x2.checkedPow(y2))
        @Expect(1, x2.checkedPow(y3))

        @Expect(1, x3.checkedPow(y1))
        @Expect(0, x3.checkedPow(y2))
        @Expect(0, x3.checkedPow(y3))

        @Expect(1, x4.checkedPow(y1))
        @Expect(2, x4.checkedPow(y2))
        @Expect(4, x4.checkedPow(y3))
    }

    @TestCase
    func case_throwingPow_int64(): Unit {
        let x1: Int64 = 1
        let x2: Int64 = -1
        let x3: Int64 = 0
        let x4: Int64 = 2
        let y1: UInt64 = UInt64(0)
        let y2: UInt64 = UInt64(1)
        let y3: UInt64 = UInt64(2)
        @Expect(1, x1.throwingPow(y1))
        @Expect(1, x1.throwingPow(y2))
        @Expect(1, x1.throwingPow(y3))

        @Expect(1, x2.throwingPow(y1))
        @Expect(-1, x2.throwingPow(y2))
        @Expect(1, x2.throwingPow(y3))

        @Expect(1, x3.throwingPow(y1))
        @Expect(0, x3.throwingPow(y2))
        @Expect(0, x3.throwingPow(y3))

        @Expect(1, x4.throwingPow(y1))
        @Expect(2, x4.throwingPow(y2))
        @Expect(4, x4.throwingPow(y3))
    }

    @TestCase
    func case_saturatingPow_int64(): Unit {
        let x1: Int64 = 1
        let x2: Int64 = -1
        let x3: Int64 = 0
        let x4: Int64 = 2
        let y1: UInt64 = UInt64(0)
        let y2: UInt64 = UInt64(1)
        let y3: UInt64 = UInt64(2)
        @Expect(1, x1.saturatingPow(y1))
        @Expect(1, x1.saturatingPow(y2))
        @Expect(1, x1.saturatingPow(y3))

        @Expect(1, x2.saturatingPow(y1))
        @Expect(-1, x2.saturatingPow(y2))
        @Expect(1, x2.saturatingPow(y3))

        @Expect(1, x3.saturatingPow(y1))
        @Expect(0, x3.saturatingPow(y2))
        @Expect(0, x3.saturatingPow(y3))

        @Expect(1, x4.saturatingPow(y1))
        @Expect(2, x4.saturatingPow(y2))
        @Expect(4, x4.saturatingPow(y3))
    }

    @TestCase
    func case_wrappingPow_int64(): Unit {
        let x1: Int64 = 1
        let x2: Int64 = -1
        let x3: Int64 = 0
        let x4: Int64 = 2
        let y1: UInt64 = UInt64(0)
        let y2: UInt64 = UInt64(1)
        let y3: UInt64 = UInt64(2)
        @Expect(1, x1.wrappingPow(y1))
        @Expect(1, x1.wrappingPow(y2))
        @Expect(1, x1.wrappingPow(y3))

        @Expect(1, x2.wrappingPow(y1))
        @Expect(-1, x2.wrappingPow(y2))
        @Expect(1, x2.wrappingPow(y3))

        @Expect(1, x3.wrappingPow(y1))
        @Expect(0, x3.wrappingPow(y2))
        @Expect(0, x3.wrappingPow(y3))

        @Expect(1, x4.wrappingPow(y1))
        @Expect(2, x4.wrappingPow(y2))
        @Expect(4, x4.wrappingPow(y3))
    }
}
