/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*

let g_c0 = C0()
let g_c1 = C1()

@Test
class Test {
    let m_c0 = C0()
    let m_c1 = C1()
    // 传入临时创建的class实例
    @TestCase
    func test1(): Unit {
        // 跳过所有抽象类, 因为抽象类不可被实例化.
        @Expect(TypeInfo.of(C0()).toString(), "MyType.myType.C0")
        @Expect(TypeInfo.of(C1()).toString(), "MyType.myType.C1")
        @Expect(TypeInfo.of(C4()).toString(), "MyType.myType.C4")
        @Expect(TypeInfo.of(C5()).toString(), "MyType.myType.C5")
        @Expect(TypeInfo.of(C6()).toString(), "MyType.myType.C6")
        @Expect(TypeInfo.of(C7<UInt32, Float64, Unit, Rune>()).toString(), "MyType.myType.C7<UInt32, Float64, Unit, Rune>")
    }
    // 传入局部变量
    @TestCase
    func test2(): Unit {
        let l_c0 = C0()
        let l_c1 = C1()
        @Expect(TypeInfo.of(l_c0).toString(), "MyType.myType.C0")
        @Expect(TypeInfo.of(l_c1).toString(), "MyType.myType.C1")
    }
    // 传入成员变量
    @TestCase
    func test3(): Unit {
        @Expect(TypeInfo.of(m_c0).toString(), "MyType.myType.C0")
        @Expect(TypeInfo.of(m_c1).toString(), "MyType.myType.C1")
    }
    // 传入全局变量
    @TestCase
    func test4(): Unit {
        @Expect(TypeInfo.of(g_c0).toString(), "MyType.myType.C0")
        @Expect(TypeInfo.of(g_c1).toString(), "MyType.myType.C1")
    }
}
