/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class ConstructorInfo
 *          Test whether ConstructorInfo is correct.
 * Test API:
 *      public prop parameters: ArrayList<ParameterInfo>
 *      public func toString(): String
 */

import std.reflect.*

@Test
class constructorInfoTest {
    @TestCase
    func emptyInitTest(): Unit {
        let info = TypeInfo.of<A>() as ClassTypeInfo
        let constructorInfo = info.getOrThrow().getConstructor()
        @Expect(constructorInfo.parameters.isEmpty())
        @Expect(constructorInfo.toString(), "init()")
    }

    @TestCase
    func emptyParmTest(): Unit {
        let info = TypeInfo.of<B>() as ClassTypeInfo
        let constructorInfo = info.getOrThrow().getConstructor()
        @Expect(constructorInfo.parameters.isEmpty())
        @Expect(constructorInfo.toString(), "init()")
    }

    @TestCase
    func primaryInitTest(): Unit {
        let info = TypeInfo.of<C>() as ClassTypeInfo
        let constructorInfo = info.getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<Bool>())
        @Expect(constructorInfo.parameters.size, 2)
        @Expect(constructorInfo.toString(), "init(Int64, Bool)")
    }

    @TestCase
    func mutilInitTest(): Unit {
        let info = TypeInfo.of<D>() as ClassTypeInfo
        let constructorInfo1 = info.getOrThrow().getConstructor()
        @Expect(constructorInfo1.parameters.isEmpty())
        @Expect(constructorInfo1.toString(), "init()")

        let constructorInfo2 = info.getOrThrow().getConstructor(TypeInfo.of<Int64>())
        @Expect(constructorInfo2.parameters.size, 1)
        @Expect(constructorInfo2.toString(), "init(Int64)")

        let constructorInfo3 = info.getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<Int32>())
        @Expect(constructorInfo3.parameters.size, 2)
        @Expect(constructorInfo3.toString(), "init(Int64, Int32)")
    }

    @TestCase
    func InheritParmTest(): Unit {
        let info = TypeInfo.of<SubClass>() as ClassTypeInfo
        let constructorInfo = info.getOrThrow().getConstructor()
        @Expect(constructorInfo.parameters.isEmpty())
        @Expect(constructorInfo.toString(), "init()")
    }
}

public class A {}

public class B {
    public init() {}
}

public class C {
    var parm1 = 1i64
    var parm2 = true

    public C(v1: Int64, v2: Bool) {
        parm1 = v1
        parm2 = v2
    }
}

public class D {
    var parm1 = 0i64
    var parm2 = 0i32
    var parm3 = 0i16
    var parm4 = 0i8
    public init() {
        parm1 = 1
    }

    public init(v: Int64) {
        parm1 = v
    }

    public init(v1: Int64, v2: Int32) {
        parm1 = v1
        parm2 = v2
    }
}

public open class FatherClass {}

public class SubClass <: FatherClass {}
