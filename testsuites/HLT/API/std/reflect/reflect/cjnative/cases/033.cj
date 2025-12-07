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

public interface I0 {}

public class C1 <: I0 {}

public class C5 <: I0 {}

public open class C2 {}

public open class C3 <: C2 {}

public class C4 <: C3 {}

public abstract class C6 {}

public open class C7 <: C6 {}

public class C8 <: C7 {}

public class C0 {
    // interface
    public static let v0: I0 = C1()
    // Any
    public static let v1: Any = 1
    // Object
    public static let v2: Object = C0()
    // open class inheritance.
    public static let v3: C2 = C3()
    // abstract class inheritance.
    public static let v4: C6 = C7()
}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        try {
            // 接口子类型。
            (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v0").setValue(C5())
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable variable 'v0'.")
        }

        try {
            // Any子类型。
            (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v1").setValue(true)
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable variable 'v1'.")
        }

        try {
            // Object子类型。
            (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v2").setValue(C1())
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable variable 'v2'.")
        }

        try {
            // 开放类继承子类型。
            (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v3").setValue(C4())
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable variable 'v3'.")
        }

        try {
            // 抽象类继承子类型。
            (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v4").setValue(C8())
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable variable 'v4'.")
        }
    }
}

main() {}
