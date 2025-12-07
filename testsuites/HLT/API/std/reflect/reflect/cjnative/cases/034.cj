/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// (not MAC) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import std.collection.*

public class C0<G0, G1, G2> {}

public class C1<G0> {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        // 类型别名。
        @Expect(TypeInfo.of<Rune>().qualifiedName, "Rune")
        @Expect(TypeInfo.of<Int>().qualifiedName, "Int64")
        @Expect(TypeInfo.of<UInt>().qualifiedName, "UInt64")

        // 标准库类型。
        // 标准库class类型。
        @Expect(TypeInfo.of<Object>().qualifiedName, "Object")
        @Expect(TypeInfo.of<ArrayList<Int64>>().qualifiedName, "std.collection.ArrayList<Int64>")
        @Expect(TypeInfo.of<Box<Box<Box<C1<Box<Int64>>>>>>().qualifiedName, "Box<Box<Box<default.C1<Box<Int64>>>>>")
        // 标准库interface类型。
        @Expect(TypeInfo.of<Any>().qualifiedName, "Any")
        @Expect(TypeInfo.of<Collection<Int64>>().qualifiedName, "Collection<Int64>")
        @Expect(TypeInfo.of<Iterable<C1<Box<Int64>>>>().qualifiedName, "Iterable<default.C1<Box<Int64>>>")
        // 标准库struct类型。
        @Expect(TypeInfo.of<String>().qualifiedName, "String")
        @Expect(TypeInfo.of<Array<Int64>>().qualifiedName, "Array<Int64>")
        @Expect(TypeInfo.of<Array<Box<Int64>>>().qualifiedName, "Array<Box<Int64>>")
        @Expect(TypeInfo.of<Array<C1<Box<Array<Int64>>>>>().qualifiedName, "Array<default.C1<Box<Array<Int64>>>>")
        @Expect(TypeInfo.of<Array<Array<Array<Int64>>>>().qualifiedName, "Array<Array<Array<Int64>>>")
        @Expect(TypeInfo.of<Array<Int64>>().qualifiedName, "Array<Int64>")

        // 标准库类型作为泛型参数。
        @Expect(TypeInfo.of<C1<Array<Int64>>>().qualifiedName, "default.C1<Array<Int64>>")
        @Expect(TypeInfo.of<C1<Collection<Int64>>>().qualifiedName, "default.C1<Collection<Int64>>")
        @Expect(TypeInfo.of<C1<Box<Int64>>>().qualifiedName, "default.C1<Box<Int64>>")

        @Expect(TypeInfo.of<C0<Array<Int64>, String, Box<String>>>().qualifiedName, "default.C0<Array<Int64>, String, Box<String>>")
    }
}

main(): Unit {
}
