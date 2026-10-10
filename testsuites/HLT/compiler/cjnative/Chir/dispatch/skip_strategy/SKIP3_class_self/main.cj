/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 跳过策略3: 通过 Class 访问且语义 target 是本类型的方法忽略 | design-spec §3 跳过策略第3条
 * 规则: ty.IsClass() && GetDeclPtrOfTy(fd.outerDecl->GetTy()) == GetDeclPtrOfTy(&ty)
 *       → 已经是最终调用版本,返回原 fd 不重排。
 * 构造: 类 C 实现接口 I1 的 foo,语义 target 即本类方法。
 *       经泛型函数 k<C>(c) 触发,baseTy=C(Class),target 在 C 本身 → 跳过3,不二次重排。
 * 预期: 直接调 C.foo,trace=[C.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP3_class_self | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_skip3

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit {
        __trace.append("[I1.foo]")
    }
}

class C <: I1 {
    public func foo(): Unit {
        __trace.append("[C.foo]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class ClassSelfTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[C.foo]")
    }
}
