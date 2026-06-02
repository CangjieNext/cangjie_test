/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE)RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether func getInstanceFunction is correct.
 * Test API:
 *      public func getInstanceFunction(supertype: TypeInfo): Bool
 */

import std.reflect.*

@Test
class TypeInfofi1ndIMF {
    @TestCase
    func selfFuncTest(): Unit {
        let a = A()
        let objType = TypeInfo.of(a)

        let f1 = objType.getInstanceFunction("f", [])
        let f2 = objType.getInstanceFunction("f", TypeInfo.of<Int64>())
        let f3 = objType.getInstanceFunction("f", TypeInfo.of<Int64>(), TypeInfo.of<Int64>())
        let f4 = objType.getInstanceFunction("frt")

        @Expect((f1.apply(a, []) as Int64).getOrThrow(), 1)
        @Expect((f2.apply(a, 1) as Int64).getOrThrow(), 2)
        @Expect((f3.apply(a, 1, 2) as Int64).getOrThrow(), 3)
    }

    @TestCase
    func genericsFuncTest(): Unit {
        let b = B<Bool>(true)
        let objType = TypeInfo.of(b)

        let fns = objType.getInstanceFunctions("f")
        for (fn in fns where fn.parameters.size == 1 && fn.parameters.toArray()[0].typeInfo.toString() == "T") {
            @Expect((fn.apply(b, [TypeInfo.of<Bool>()], [true]) as Int64).getOrThrow(), 1)
        }
        let f2 = objType.getInstanceFunction("f", [])
        @Expect((f2.apply(b, []) as Bool).getOrThrow(), true)
    }

    @TestCase
    func inheritFuncTest(): Unit {
        let c = C1()
        let objType = TypeInfo.of(c)

        let f1 = objType.getInstanceFunction("fi1", [])
        let f2 = objType.getInstanceFunction("fi1", TypeInfo.of<Int64>())
        let f3 = objType.getInstanceFunction("fi1", TypeInfo.of<Int64>(), TypeInfo.of<Int64>())
        let f4 = objType.getInstanceFunction("frti1", [])

        let f5 = objType.getInstanceFunction("fi2", [])
        let f6 = objType.getInstanceFunction("fi2", TypeInfo.of<Int64>())
        let f7 = objType.getInstanceFunction("fi2", TypeInfo.of<Int64>(), TypeInfo.of<Int64>())
        let f8 = objType.getInstanceFunction("frti2", [])

        @Expect((f1.apply(c, []) as Int64).getOrThrow(), 1)
        @Expect((f2.apply(c, 1) as Int64).getOrThrow(), 2)
        @Expect((f3.apply(c, 1, 2) as Int64).getOrThrow(), 3)

        @Expect((f5.apply(c, []) as Int64).getOrThrow(), 2)
        @Expect((f6.apply(c, 1) as Int64).getOrThrow(), 0)
        @Expect((f7.apply(c, 1, 2) as Int64).getOrThrow(), -1)
    }
}
/**************************************************************************/
public class A {
    public func f(): Int64 {
        return 1
    }

    public func f(val: Int64): Int64 {
        return val + 1
    }

    public func f(val1: Int64, val2: Int64): Int64 {
        return val1 + val2
    }

    public func frt(): (Int64, Int64) {
        return (1, 1)
    }
}

public class B<T> {
    let v: T

    init(a: T) {
        v = a
    }

    public func f(a: T): Int64 {
        return 1
    }

    public func f(): T {
        return v
    }
}
/**************************************************************************/
public interface I1 {
    func fi1(): Int64

    func fi1(val: Int64): Int64

    func fi1(val1: Int64, val2: Int64): Int64

    func frti1(): (Int64, Int64)
}

public interface I2 {
    func fi2(): Int64

    func fi2(val: Int64): Int64

    func fi2(val1: Int64, val2: Int64): Int64

    func frti2(): (Int64, Int64)
}

public class C1 <: I1 & I2 {
    public func fi1(): Int64 {
        return 1
    }

    public func fi1(val: Int64): Int64 {
        return val + 1
    }

    public func fi1(val1: Int64, val2: Int64): Int64 {
        return val1 + val2
    }

    public func frti1(): (Int64, Int64) {
        return (1, 1)
    }

    public func fi2(): Int64 {
        return 2
    }

    public func fi2(val: Int64): Int64 {
        return val - 1
    }

    public func fi2(val1: Int64, val2: Int64): Int64 {
        return val1 - val2
    }

    public func frti2(): (Int64, Int64) {
        return (2, 2)
    }
}
/**************************************************************************/
public interface Ig1<T> {
    func fi11(a: T): Unit

    func fi12(): T
}

public interface Ig2<T> {
    func fi21(a: T): Unit

    func fi22(): T
}

public class C2<T> <: Ig1<T> & Ig2<T> {
    var parm: T
    public init(a: T) {
        parm = a
    }

    public func fi11(a: T): Unit {
        println("this is Interface 1 func")
    }

    public func fi12(): T {
        return parm
    }

    public func fi21(a: T): Unit {
        println("this is Interface 2 func")
    }

    public func fi22(): T {
        return parm
    }
}
