/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-SEED | DFX case8 | 六步⑤Equatable 扩展实例化选取 | 运行时 oracle(无 manifest ID)
 * 需求 design-spec §7: 扩展实现 operator ==,实例化选取扩展版本。
 * 手写落地(已验证 O0/O2 TRACE_OK)。
 */
// Level: 1
// Description:
// 六步种子 扩展 Equatable | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface IEq<T> {
    operator func ==(other: T): Bool
}

class Box<T> {}

extend Box<UInt8> <: IEq<Box<UInt8>> {
    public operator func ==(other: Box<UInt8>): Bool {
        __trace.append("[extend_Box_IEq.==]")
        true
    }
}


@Test
class ExtendEquatableOperatorTest {
    @TestCase
    func traceCheck(): Unit {

    let obj0: Box<UInt8> = Box<UInt8>()
    let ext0: IEq<Box<UInt8>> = Box<UInt8>()
    ext0 == Box<UInt8>()
        @Expect(__trace.toString(), "[extend_Box_IEq.==]")
    }
}
