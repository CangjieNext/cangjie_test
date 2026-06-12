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
 *          Test whether ClassTypeInfo is correct.
 * Test API:
 *      public static func of<T>(): TypeInfo
 */

import std.reflect.*
import std.collection.ArrayList

@Test
class classTypeInfoTest {
    @TestCase
    func testClassConstructor(): Unit {
        let f = (TypeInfo.of<Foo>() as ClassTypeInfo).getOrThrow()
        let ctor = f.getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<Bool>())
        let instance = ctor.apply(11, true)
        @Expect(instance is Foo)
        @Expect((instance as Foo).getOrThrow().f1, 11)
    }

    @TestCase
    func testStructConstructor(): Unit {
        let f = (TypeInfo.of<Bar>() as StructTypeInfo).getOrThrow()
        let ctor = f.getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<Bool>())
        let instance = ctor.apply(11, true)
        @Expect(instance is Bar)
        @Expect((instance as Bar).getOrThrow().b1, 11)
    }

    @TestCase
    func testConstructorOrder(): Unit {
        let ty = ClassTypeInfo.get("default.Foo01")
        // 获取 constructors
        @Expect(ty.constructors.toArray()[0].toString(), "init()")
        @Expect(ty.constructors.toArray()[1].toString(), "init(Int64, Bool)")
        @Expect(ty.constructors.toArray()[2].toString(), "init(UInt8, Float32)")
        @Expect(ty.constructors.toArray()[3].toString(), "init(Float32, UInt8)")
        @Expect(ty.constructors.toArray()[4].toString(), "init(Bool, Int64)")
        @Expect(ty.constructors.toArray()[5].toString(), "init(UInt32, Int64, UInt8)")
    }
}

public class Foo {
    public var f1: Int64 = 1
    public var f2: Bool = false
    public init(a1: Int64, a2: Bool) {
        f1 = a1
        f2 = a2
    }
}

public class Foo01 {
    public var f1: Int64 = 1
    public var f2: Bool = false
    public init(){}
    public init(a1: Int64, a2: Bool) {}
    public init(a1: Byte, a2: Float32) {}
    public init(a1: Float32, a2: Byte) {}
    public init(a1: Bool, a2: Int64) {}
    public init(a1: UInt32, a2: Int64, a3: UInt8) {}
}

public struct Bar {
    public var b1: Int64 = 1
    public var b2: Bool = false
    init() {
        println("hello")
    }
    public init(a1: Int64, a2: Bool) {
        b1 = a1
        b2 = a2
    }
}
