/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 跳过策略1: 非成员/非虚成员忽略 | 对应 design-spec §3 跳过策略第1条
 * 规则: !fd.outerDecl || !IsVirtualMember(fd) → 返回原 fd 不重排。
 *      private 成员不可覆盖(IsVirtualMember 判定为非虚),不参与按需查询重排。
 * 构造: 类 C 同时有 private _foo(非虚,跳过)与 public foo(实现接口)。
 *       private _foo 不被识别为接口 I1.foo 的实现,public foo 被选中。
 * 预期: 泛型函数 k<C> 触发按需查询,选中 public foo,trace=[C.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP1_nonmember | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_skip1

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit
}

class C <: I1 {
    private func _foo(): Unit {
        __trace.append("[C._foo(private)]")
    }
    public func foo(): Unit {
        __trace.append("[C.foo]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class NonmemberTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[C.foo]")
    }
}
