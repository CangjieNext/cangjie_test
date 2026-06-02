/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether func StaticFunctionInfo apply is correct.
 * Test API:
 *      public func apply(args: Array<Any>): Bool
 */

import std.reflect.*

@Test
class TypeInfoInstanceFunction {
    @TestCase
    func testApply(): Unit {
        let a = A()
        let objType = TypeInfo.of(a)

        let funcReturnFoo = objType.getStaticFunction("funcReturnFoo", [])
        let funcStructAsParameter = objType.getStaticFunction("funcStructAsParameter", TypeInfo.of<Foo>())

        @Expect((funcReturnFoo.apply(objType, []) as Foo).getOrThrow().f1, 11)
        @Expect((funcStructAsParameter.apply(objType, Foo()) as Foo).getOrThrow().f1, 11)

        let funcTwoStructAsParameter = objType.getStaticFunction("funcTwoStructAsParameter", TypeInfo.of<Foo>(),
            TypeInfo.of<Foo>())
        let foo = Foo()
        @Expect((funcTwoStructAsParameter.apply(objType, foo, foo) as Int64).getOrThrow(), 33)
    }
}
/**************************************************************************/

public struct Foo {
    public var f1 = 11
    public var f2 = 22
    public var f3 = 33
}

public class A {
    public static func funcReturnFoo(): Foo {
        var ret: Foo = Foo()
        return ret
    }
    public static func funcStructAsParameter(a: Foo) {
        return a
    }
    public static func funcTwoStructAsParameter(a: Foo, b: Foo) {
        if (b.f1 != 11) {
            return 1
        }
        if (b.f2 != 22) {
            return 2
        }
        if (b.f3 != 33) {
            return 3
        }
        return a.f3
    }
}
