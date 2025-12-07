/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args

import std.reflect.*

/* 不支持运行时类型为函数类型，元组类型，enum 类型和带有泛型的 struct 类型 */

interface I0 {}

interface I1 {}

interface I11 <: I0 & I1 {}

abstract class C1 {}

open class C2 <: C1 {}

class C3 <: C2 {}

extend C3 {}

class C3_C {
    const init() {}
}

class C4 <: I1 {}

interface I2<T> {}

open class C5<T> <: I2<T> {}

class C6<T> <: C5<T> {}

extend<T> C6<T> {}

class C6_C<T, U> {
    let a = 0
    const init() {}
}

struct S1 {}

struct S1_C {
    const init() {}
}

@Test
class Test_Of {
    @TestCase
    func testClass01(): Unit {
        @Expect(ClassTypeInfo.of(C3()).toString(), "default.C3")
        @Expect(ClassTypeInfo.of(C4()).toString(), "default.C4")
        @Expect(ClassTypeInfo.of(C5<Int64>()).toString(), "default.C5<Int64>")
        @Expect(ClassTypeInfo.of(C6<(Int64, String)>()).toString(), "default.C6<Tuple<Int64, String>>")
        @Expect(StructTypeInfo.of(S1()).toString(), "default.S1")
    }

    @TestCase
    func testClass01_C(): Unit {
        const c3_C = C3_C()
        const c6_C = C6_C<Int64, C3>()
        const s1_C = S1_C()
        @Expect(ClassTypeInfo.of(c3_C).toString(), "default.C3_C")
        @Expect(ClassTypeInfo.of(c6_C).toString(), "default.C6_C<Int64, default.C3>")
        @Expect(StructTypeInfo.of(s1_C).toString(), "default.S1_C")
        @Expect(PrimitiveTypeInfo.of(c6_C.a).toString(), "Int64")
    }

    @TestCase
    func testClass02(): Unit {
        let obj: C2 = C3()
        @Expect(ClassTypeInfo.of(obj).toString(), "default.C3")
    }

    @TestCase
    func testClass03(): Unit {
        let obj: C5<Int64> = C6<Int64>()
        @Expect(ClassTypeInfo.of(obj).toString(), "default.C6<Int64>")
    }

    @TestCase
    func testClass04(): Unit {
        @Expect(InterfaceTypeInfo.of<I1>().toString(), "default.I1")
        @Expect(InterfaceTypeInfo.of<I11>().toString(), "default.I11")
        @Expect(ClassTypeInfo.of<C1>().toString(), "default.C1")
        @Expect(ClassTypeInfo.of<C2>().toString(), "default.C2")
        @Expect(ClassTypeInfo.of<C3>().toString(), "default.C3")
        @Expect(ClassTypeInfo.of<C4>().toString(), "default.C4")
        @Expect(InterfaceTypeInfo.of<I2<String>>().toString(), "default.I2<String>")
        @Expect(ClassTypeInfo.of<C5<Array<Int64>>>().toString(), "default.C5<Array<Int64>>")
        @Expect(ClassTypeInfo.of<C6<(String, C3)>>().toString(), "default.C6<Tuple<String, default.C3>>")
    }

    @TestCase
    func testClass04_C(): Unit {
        @Expect(ClassTypeInfo.of<C3_C>().toString(), "default.C3_C")
        @Expect(StructTypeInfo.of<S1_C>().toString(), "default.S1_C")
        @Expect(ClassTypeInfo.of<C6_C<C2, C3_C>>().toString(), "default.C6_C<default.C2, default.C3_C>")
    }
}
