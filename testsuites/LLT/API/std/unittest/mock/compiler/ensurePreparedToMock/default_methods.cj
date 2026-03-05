/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (LLVM) EXEC: %compiler %cmp_opt -Woff=all --test %f -o %output 2>&1
// (LLVM) EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public interface I {
    func FUNC(): String { "original" }
    static func STATIC_FUNC(): String { "original" }
    @When[backend == "cjnative"]
    func FUNC_GENERIC<T>(x: T): String { "original" }
    static func STATIC_FUNC_GENERIC<T>(x: T): String { "original" }
}

class C1 <: I {}

class C2 {}
extend C2 <: I {}

extend C1 {
    public func instance_ref_call() {
        let f = FUNC
        return f()
    }

    public func instance_call() {
        return FUNC()
    }

    public static func static_ref_call() {
        let f = STATIC_FUNC
        return f()
    }

    public static func static_call() {
        return STATIC_FUNC()
    }

    @When[backend == "cjnative"]
    public func instance_ref_call_generic<T>(x: T) {
        let f = FUNC_GENERIC<T>
        return f(x)
    }

    @When[backend == "cjnative"]
    public func instance_call_generic<T>(x: T) {
        return FUNC_GENERIC<T>(x)
    }

    public static func static_ref_call_generic<T>(x: T) {
        let f = STATIC_FUNC_GENERIC<T>
        return f(x)
    }

    public static func static_call_generic<T>(x: T) {
        return STATIC_FUNC_GENERIC<T>(x)
    }
}

extend C2 {
    public func instance_ref_call() {
        let f = FUNC
        return f()
    }

    public func instance_call() {
        return FUNC()
    }

    public static func static_ref_call() {
        let f = STATIC_FUNC
        return f()
    }

    public static func static_call() {
        return STATIC_FUNC()
    }

    @When[backend == "cjnative"]
    public func instance_ref_call_generic<T>(x: T) {
        let f = FUNC_GENERIC<T>
        return f(x)
    }

    @When[backend == "cjnative"]
    public func instance_call_generic<T>(x: T) {
        return FUNC_GENERIC<T>(x)
    }

    public static func static_ref_call_generic<T>(x: T) {
        let f = STATIC_FUNC_GENERIC<T>
        return f(x)
    }

    public static func static_call_generic<T>(x: T) {
        return STATIC_FUNC_GENERIC<T>(x)
    }
}


func instance_member_access_call<T>(x: T): String where T <: I {
    let f = x.FUNC
    return f()
}

func instance_call<T>(x: T): String where T <: I {
    return x.FUNC()
}

func static_member_access_call<T>(): String where T <: I {
    let f = T.STATIC_FUNC
    return f()
}

func static_call<T>(): String where T <: I {
    return T.STATIC_FUNC()
}

@When[backend == "cjnative"]
func instance_member_access_call_generic<T, E>(x: T, y: E): String where T <: I {
    let f = x.FUNC_GENERIC<E>
    return f(y)
}

@When[backend == "cjnative"]
func instance_call_generic<T, E>(x: T, y: E): String where T <: I {
    return x.FUNC_GENERIC<E>(y)
}

func static_member_access_call_generic<T, E>(x: E): String where T <: I {
    let f = T.STATIC_FUNC_GENERIC<E>
    return f(x)
}

func static_call_generic<T, E>(x: E): String where T <: I {
    return T.STATIC_FUNC_GENERIC<E>(x)
}

@Test
func test_instance_C1() {
    let a = mock<C1>()
    @On(a.FUNC()).returns("mocked")
    @Expect(instance_member_access_call(a), "mocked")
    @Expect(instance_call(a), "mocked")
    @Expect(a.instance_ref_call(), "mocked")
    @Expect(a.instance_call(), "mocked")
    @Expect(a.FUNC(), "mocked")
}

@Test
func test_instance_C2() {
    let a = mock<C2>()
    @On(a.FUNC()).returns("mocked")
    @Expect(instance_member_access_call(a), "mocked")
    @Expect(instance_call(a), "mocked")
    @Expect(a.instance_ref_call(), "mocked")
    @Expect(a.instance_call(), "mocked")
    @Expect(a.FUNC(), "mocked")
}

@Test
func test_static_C1() {
    @On(C1.STATIC_FUNC()).returns("mocked")
    @Expect(static_member_access_call<C1>(), "mocked")
    @Expect(static_call<C1>(), "mocked")
    @Expect(C1.static_ref_call(), "mocked")
    @Expect(C1.static_call(), "mocked")
    @Expect(C1.STATIC_FUNC(), "mocked")
}

@Test
func test_static_C2() {
    @On(C2.STATIC_FUNC()).returns("mocked")
    @Expect(static_member_access_call<C2>(), "mocked")
    @Expect(static_call<C2>(), "mocked")
    @Expect(C2.static_ref_call(), "mocked")
    @Expect(C2.static_call(), "mocked")
    @Expect(C2.STATIC_FUNC(), "mocked")
}

@Test
func test_static_both() {
    @On(C2.STATIC_FUNC()).returns("mocked C2")
    @On(C1.STATIC_FUNC()).returns("mocked C1")

    @Expect(static_member_access_call<C2>(), "mocked C2")
    @Expect(static_call<C2>(), "mocked C2")
    @Expect(C2.static_ref_call(), "mocked C2")
    @Expect(C2.static_call(), "mocked C2")
    @Expect(C2.STATIC_FUNC(), "mocked C2")

    @Expect(static_member_access_call<C1>(), "mocked C1")
    @Expect(static_call<C1>(), "mocked C1")
    @Expect(C1.static_ref_call(), "mocked C1")
    @Expect(C1.static_call(), "mocked C1")
    @Expect(C1.STATIC_FUNC(), "mocked C1")
}

@When[backend == "cjnative"]
@Test
func test_instance_generic_C1() {
    let a = mock<C1>()
    @On(a.FUNC_GENERIC<Int64>(_)).returns("mocked Int")
    @On(a.FUNC_GENERIC<String>(_)).returns("mocked String")
    @Expect(instance_member_access_call_generic<C1, Int64>(a, 10), "mocked Int")
    @Expect(instance_member_access_call_generic<C1, String>(a, "10"), "mocked String")
    @Expect(instance_call_generic<C1, Int64>(a, 10), "mocked Int")
    @Expect(instance_call_generic<C1, String>(a, "10"), "mocked String")
    @Expect(a.instance_ref_call_generic<Int64>(10), "mocked Int")
    @Expect(a.instance_ref_call_generic<String>("10"), "mocked String")
    @Expect(a.instance_call_generic<Int64>(10), "mocked Int")
    @Expect(a.instance_call_generic<String>("10"), "mocked String")
    @Expect(a.FUNC_GENERIC<Int64>(10), "mocked Int")
    @Expect(a.FUNC_GENERIC<String>("10"), "mocked String")
}

@When[backend == "cjnative"]
@Test
func test_instance_generic_C2() {
    let a = mock<C2>()
    @On(a.FUNC_GENERIC<Int64>(_)).returns("mocked Int")
    @On(a.FUNC_GENERIC<String>(_)).returns("mocked String")
    @Expect(instance_member_access_call_generic<C2, Int64>(a, 10), "mocked Int")
    @Expect(instance_member_access_call_generic<C2, String>(a, "10"), "mocked String")
    @Expect(instance_call_generic<C2, Int64>(a, 10), "mocked Int")
    @Expect(instance_call_generic<C2, String>(a, "10"), "mocked String")
    @Expect(a.instance_ref_call_generic<Int64>(10), "mocked Int")
    @Expect(a.instance_ref_call_generic<String>("10"), "mocked String")
    @Expect(a.instance_call_generic<Int64>(10), "mocked Int")
    @Expect(a.instance_call_generic<String>("10"), "mocked String")
    @Expect(a.FUNC_GENERIC<Int64>(10), "mocked Int")
    @Expect(a.FUNC_GENERIC<String>("10"), "mocked String")
}

@Test
func test_static_generic_C1() {
    @On(C1.STATIC_FUNC_GENERIC<Int64>(_)).returns("mocked Int")
    @On(C1.STATIC_FUNC_GENERIC<String>(_)).returns("mocked String")
    @Expect(static_member_access_call_generic<C1, Int64>(10), "mocked Int")
    @Expect(static_member_access_call_generic<C1, String>("10"), "mocked String")
    @Expect(static_call_generic<C1, Int64>(10), "mocked Int")
    @Expect(static_call_generic<C1, String>("10"), "mocked String")
    @Expect(C1.static_ref_call_generic<Int64>(10), "mocked Int")
    @Expect(C1.static_ref_call_generic<String>("10"), "mocked String")
    @Expect(C1.static_call_generic<Int64>(10), "mocked Int")
    @Expect(C1.static_call_generic<String>("10"), "mocked String")
    @Expect(C1.STATIC_FUNC_GENERIC<Int64>(10), "mocked Int")
    @Expect(C1.STATIC_FUNC_GENERIC<String>("10"), "mocked String")
}

@Test
func test_static_generic_C2() {
    @On(C2.STATIC_FUNC_GENERIC<Int64>(_)).returns("mocked Int")
    @On(C2.STATIC_FUNC_GENERIC<String>(_)).returns("mocked String")
    @Expect(static_member_access_call_generic<C2, Int64>(10), "mocked Int")
    @Expect(static_member_access_call_generic<C2, String>("10"), "mocked String")
    @Expect(static_call_generic<C2, Int64>(10), "mocked Int")
    @Expect(static_call_generic<C2, String>("10"), "mocked String")
    @Expect(C2.static_ref_call_generic<Int64>(10), "mocked Int")
    @Expect(C2.static_ref_call_generic<String>("10"), "mocked String")
    @Expect(C2.static_call_generic<Int64>(10), "mocked Int")
    @Expect(C2.static_call_generic<String>("10"), "mocked String")
    @Expect(C2.STATIC_FUNC_GENERIC<Int64>(10), "mocked Int")
    @Expect(C2.STATIC_FUNC_GENERIC<String>("10"), "mocked String")
}

@Test
func test_static_generic_both() {
    @On(C2.STATIC_FUNC_GENERIC<Int64>(_)).returns("mocked C2 Int")
    @On(C2.STATIC_FUNC_GENERIC<String>(_)).returns("mocked C2 String")
    @On(C1.STATIC_FUNC_GENERIC<Int64>(_)).returns("mocked C1 Int")
    @On(C1.STATIC_FUNC_GENERIC<String>(_)).returns("mocked C1 String")

    @Expect(static_member_access_call_generic<C2, Int64>(10), "mocked C2 Int")
    @Expect(static_member_access_call_generic<C2, String>("10"), "mocked C2 String")
    @Expect(static_call_generic<C2, Int64>(10), "mocked C2 Int")
    @Expect(static_call_generic<C2, String>("10"), "mocked C2 String")
    @Expect(C2.static_ref_call_generic<Int64>(10), "mocked C2 Int")
    @Expect(C2.static_ref_call_generic<String>("10"), "mocked C2 String")
    @Expect(C2.static_call_generic<Int64>(10), "mocked C2 Int")
    @Expect(C2.static_call_generic<String>("10"), "mocked C2 String")
    @Expect(C2.STATIC_FUNC_GENERIC<Int64>(10), "mocked C2 Int")
    @Expect(C2.STATIC_FUNC_GENERIC<String>("10"), "mocked C2 String")

    @Expect(static_member_access_call_generic<C1, Int64>(10), "mocked C1 Int")
    @Expect(static_member_access_call_generic<C1, String>("10"), "mocked C1 String")
    @Expect(static_call_generic<C1, Int64>(10), "mocked C1 Int")
    @Expect(static_call_generic<C1, String>("10"), "mocked C1 String")
    @Expect(C1.static_ref_call_generic<Int64>(10), "mocked C1 Int")
    @Expect(C1.static_ref_call_generic<String>("10"), "mocked C1 String")
    @Expect(C1.static_call_generic<Int64>(10), "mocked C1 Int")
    @Expect(C1.static_call_generic<String>("10"), "mocked C1 String")
    @Expect(C1.STATIC_FUNC_GENERIC<Int64>(10), "mocked C1 Int")
    @Expect(C1.STATIC_FUNC_GENERIC<String>("10"), "mocked C1 String")
}
