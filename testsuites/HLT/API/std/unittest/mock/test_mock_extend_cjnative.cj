/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (CJNATIVE) EXEC: %run %run_opt %output %run_utest_opt %run_args

package testsuite_mock

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public class NonGenericClass {
    public func NonGenericClassNonGenericInstanceFunction(i: Int64): String {
        "NonGenericClassNonGenericInstanceFunction${i}"
    }
    public static func NonGenericClassNonGenericStaticFunction(i: Int64): String {
        "NonGenericClassNonGenericStaticFunction${i}"
    }
    public func NonGenericClassGenericInstanceFunction<F0>(i: Int64): String {
        "NonGenericClassGenericInstanceFunction${i}"
    }
    public static func NonGenericClassGenericStaticFunction<F0>(i: Int64): String {
        "NonGenericClassGenericStaticFunction${i}"
    }
}

public abstract class NonGenericAbstractClass {
    public func NonGenericAbstractClassNonGenericInstanceFunction(i: Int64): String {
        "NonGenericAbstractClassNonGenericInstanceFunction${i}"
    }
    public static func NonGenericAbstractClassNonGenericStaticFunction(i: Int64): String {
        "NonGenericAbstractClassNonGenericStaticFunction${i}"
    }
    public func NonGenericAbstractClassGenericInstanceFunction<F0>(i: Int64): String {
        "NonGenericAbstractClassGenericInstanceFunction${i}"
    }
    public static func NonGenericAbstractClassGenericStaticFunction<F0>(i: Int64): String {
        "NonGenericAbstractClassGenericStaticFunction${i}"
    }
}

public open class NonGenericOpenClass {
    public func NonGenericOpenClassNonGenericInstanceFunction(i: Int64): String {
        "NonGenericOpenClassNonGenericInstanceFunction${i}"
    }
    public static func NonGenericOpenClassNonGenericStaticFunction(i: Int64): String {
        "NonGenericOpenClassNonGenericStaticFunction${i}"
    }
    public func NonGenericOpenClassGenericInstanceFunction<F0>(i: Int64): String {
        "NonGenericOpenClassGenericInstanceFunction${i}"
    }
    public static func NonGenericOpenClassGenericStaticFunction<F0>(i: Int64): String {
        "NonGenericOpenClassGenericStaticFunction${i}"
    }
}

extend NonGenericClass {
    public func ExtendNonGenericClassInstanceFunction(i: Int64): String {
        "ExtendNonGenericClassInstanceFunction${i}"
    }
    public static func ExtendNonGenericClassStaticFunction(i: Int64): String {
        "ExtendNonGenericClassStaticFunction${i}"
    }
    public func ExtendNonGenericClassGenericInstanceFunction<F0>(i: Int64): String {
        "ExtendNonGenericClassGenericInstanceFunction${i}"
    }
    public static func ExtendNonGenericClassGenericStaticFunction<F0>(i: Int64): String {
        "ExtendNonGenericClassGenericStaticFunction${i}"
    }
}

extend NonGenericAbstractClass {
    public func ExtendNonGenericAbstractClassInstanceFunction(i: Int64): String {
        "ExtendNonGenericAbstractClassInstanceFunction${i}"
    }
    public static func ExtendNonGenericAbstractClassStaticFunction(i: Int64): String {
        "ExtendNonGenericAbstractClassStaticFunction${i}"
    }
    public func ExtendNonGenericAbstractClassGenericInstanceFunction<F0>(i: Int64): String {
        "ExtendNonGenericAbstractClassGenericInstanceFunction${i}"
    }
    public static func ExtendNonGenericAbstractClassGenericStaticFunction<F0>(i: Int64): String {
        "ExtendNonGenericAbstractClassGenericStaticFunction${i}"
    }
}

extend NonGenericOpenClass {
    public func ExtendNonGenericOpenClassInstanceFunction(i: Int64): String {
        "ExtendNonGenericOpenClassInstanceFunction${i}"
    }
    public static func ExtendNonGenericOpenClassStaticFunction(i: Int64): String {
        "ExtendNonGenericOpenClassStaticFunction${i}"
    }
    public func ExtendNonGenericOpenClassGenericInstanceFunction<F0>(i: Int64): String {
        "ExtendNonGenericOpenClassGenericInstanceFunction${i}"
    }
    public static func ExtendNonGenericOpenClassGenericStaticFunction<F0>(i: Int64): String {
        "ExtendNonGenericOpenClassGenericStaticFunction${i}"
    }
}

public class GenericClass<T0> {
    public func GenericClassInstanceFunction(i: Int64): String {
        "GenericClassInstanceFunction${i}"
    }
    public func GenericClassGenericInstanceFunction<T1>(i: Int64): String {
        "GenericClassGenericInstanceFunction${i}"
    }
    public static func GenericClassNonGenericStaticFunction(i: Int64): String {
        "GenericClassNonGenericStaticFunction${i}"
    }
    public static func GenericClassGenericStaticFunction(i: Int64): String {
        "GenericClassGenericStaticFunction${i}"
    }
}

extend<T0> GenericClass<T0> {
    public func ExtendGenericClassNonGenericInstanceFunction(i: Int64): String {
        "ExtendGenericClassNonGenericInstanceFunction${i}"
    }
    public static func ExtendGenericClassNonGenericStaticFunction(i: Int64): String {
        "ExtendGenericClassNonGenericStaticFunction${i}"
    }
    public func ExtendGenericClassGenericInstanceFunction<F0>(i: Int64): String {
        "ExtendGenericClassGenericInstanceFunction${i}"
    }
    public static func ExtendGenericClassGenericStaticFunction<F0>(i: Int64): String {
        "ExtendGenericClassGenericStaticFunction${i}"
    }
}

public interface NonGenericInterface {
    func NonGenericInterfaceInstanceFunctionWithDefaultImpl(i: Int64): String {
        "NonGenericInterfaceInstanceFunctionWithDefaultImpl${i}"
    }
    static func NonGenericInterfaceStaticFunctionWithDefaultImpl(i: Int64): String {
        "NonGenericInterfaceStaticFunctionWithDefaultImpl${i}"
    }
    func NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(i: Int64): String
    static func NonGenericInterfaceStaticFunctionWithoutDefaultImpl(i: Int64): String
    func NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<F0>(i: Int64): String {
        "NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl${i}"
    }
    static func NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<F0>(i: Int64): String {
        "NonGenericInterfaceGenericStaticFunctionWithDefaultImpl${i}"
    }
    func NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<F0>(i: Int64): String
    static func NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<F0>(i: Int64): String
}

extend NonGenericClass <: NonGenericInterface {
    public func NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(i: Int64): String {
        "NonGenericInterfaceInstanceFunctionWithoutDefaultImpl${i}"
    }
    public static func NonGenericInterfaceStaticFunctionWithoutDefaultImpl(i: Int64): String {
        "NonGenericInterfaceStaticFunctionWithoutDefaultImpl${i}"
    }
    public func NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<F0>(i: Int64): String {
        "NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl${i}"
    }
    public static func NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<F0>(i: Int64): String {
        "NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl${i}"
    }
}

extend NonGenericAbstractClass <: NonGenericInterface {
    public func NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(i: Int64): String {
        "NonGenericInterfaceInstanceFunctionWithoutDefaultImpl${i}"
    }
    public static func NonGenericInterfaceStaticFunctionWithoutDefaultImpl(i: Int64): String {
        "NonGenericInterfaceStaticFunctionWithoutDefaultImpl${i}"
    }
    public func NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<F0>(i: Int64): String {
        "NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl${i}"
    }
    public static func NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<F0>(i: Int64): String {
        "NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl${i}"
    }
}

@Test
class TestExtendNonGenericClass {
    @TestCase
    func ExtendNonGenericClassStaticFunction(): Unit {
        @On(NonGenericClass.ExtendNonGenericClassStaticFunction(114514i64)).returns("mocked")
        @Expect(NonGenericClass.ExtendNonGenericClassStaticFunction(114514i64), "mocked")
    }
    @TestCase
    func ExtendNonGenericClassInstanceFunction(): Unit {
        let c = mock<NonGenericClass>()
        @On(c.ExtendNonGenericClassInstanceFunction(114514i64)).returns("mocked")
        @Expect(c.ExtendNonGenericClassInstanceFunction(114514i64), "mocked")
    }
    @TestCase
    func ExtendNonGenericClassGenericInstanceFunction(): Unit {
        let c = mock<NonGenericClass>()
        @On(c.ExtendNonGenericClassGenericInstanceFunction<Int64>(_)).returns("mocked_")
        @On(c.ExtendNonGenericClassGenericInstanceFunction<Int64>(114514i64)).returns("mockedInt64")
        @On(c.ExtendNonGenericClassGenericInstanceFunction<String>(114514i64)).returns("mockedString")
        @Expect(c.ExtendNonGenericClassGenericInstanceFunction<Int64>(555), "mocked_")
        @Expect(c.ExtendNonGenericClassGenericInstanceFunction<Int64>(114514i64), "mockedInt64")
        @Expect(c.ExtendNonGenericClassGenericInstanceFunction<String>(114514i64), "mockedString")
    }
    @TestCase
    func ExtendNonGenericClassGenericStaticFunction(): Unit {
        @On(NonGenericClass.ExtendNonGenericClassGenericStaticFunction<Int64>(_)).returns("mocked_")
        @On(NonGenericClass.ExtendNonGenericClassGenericStaticFunction<Int64>(114514i64)).returns("mockedInt64")
        @On(NonGenericClass.ExtendNonGenericClassGenericStaticFunction<String>(114514i64)).returns("mockedString")
        @Expect(NonGenericClass.ExtendNonGenericClassGenericStaticFunction<Int64>(555), "mocked_")
        @Expect(NonGenericClass.ExtendNonGenericClassGenericStaticFunction<Int64>(114514i64), "mockedInt64")
        @Expect(NonGenericClass.ExtendNonGenericClassGenericStaticFunction<String>(114514i64), "mockedString")
    }
}

@Test
class TestNonGenericClass {
    @TestCase
    func NonGenericClassNonGenericInstanceFunction(): Unit {
        let c = mock<NonGenericClass>()
        @On(c.NonGenericClassNonGenericInstanceFunction(_)).returns("???")
        @On(c.NonGenericClassNonGenericInstanceFunction(114514i64)).returns("mocked")
        @Expect(c.NonGenericClassNonGenericInstanceFunction(555), "???")
        @Expect(c.NonGenericClassNonGenericInstanceFunction(114514i64), "mocked")
    }
    @TestCase
    func NonGenericClassNonGenericStaticFunction(): Unit {
        @On(NonGenericClass.NonGenericClassNonGenericStaticFunction(114514i64)).returns("mocked")
        @Expect(NonGenericClass.NonGenericClassNonGenericStaticFunction(555), "NonGenericClassNonGenericStaticFunction555")
        @Expect(NonGenericClass.NonGenericClassNonGenericStaticFunction(114514i64), "mocked")
    }
    @TestCase
    func NonGenericClassGenericInstanceFunction(): Unit {
        let c = mock<NonGenericClass>()
        @On(c.NonGenericClassGenericInstanceFunction<Int64>(_)).returns("mocked_")
        @On(c.NonGenericClassGenericInstanceFunction<Int64>(114514i64)).returns("mockedInt64")
        @On(c.NonGenericClassGenericInstanceFunction<String>(114514i64)).returns("mockedString")
        @Expect(c.NonGenericClassGenericInstanceFunction<Int64>(555), "mocked_")
        @Expect(c.NonGenericClassGenericInstanceFunction<Int64>(114514i64), "mockedInt64")
        @Expect(c.NonGenericClassGenericInstanceFunction<String>(114514i64), "mockedString")
    }
    @TestCase
    func NonGenericClassGenericStaticFunction(): Unit {
        @On(NonGenericClass.NonGenericClassGenericStaticFunction<Int64>(_)).returns("mocked_")
        @On(NonGenericClass.NonGenericClassGenericStaticFunction<Int64>(114514i64)).returns("mockedInt64")
        @On(NonGenericClass.NonGenericClassGenericStaticFunction<String>(114514i64)).returns("mockedString")
        @Expect(NonGenericClass.NonGenericClassGenericStaticFunction<Int64>(555), "mocked_")
        @Expect(NonGenericClass.NonGenericClassGenericStaticFunction<Int64>(114514i64), "mockedInt64")
        @Expect(NonGenericClass.NonGenericClassGenericStaticFunction<String>(114514i64), "mockedString")
    }
}

@Test
class TestNonGenericInterface {
    @TestCase
    func NonGenericInterfaceInstanceFunctionWithDefaultImpl(): Unit {
        let c = mock<NonGenericInterface>()
        @On(c.NonGenericInterfaceInstanceFunctionWithDefaultImpl(_)).returns("mocked_")
        @On(c.NonGenericInterfaceInstanceFunctionWithDefaultImpl(114514i64)).returns("mockedInt64")
        @Expect(c.NonGenericInterfaceInstanceFunctionWithDefaultImpl(555), "mocked_")
        @Expect(c.NonGenericInterfaceInstanceFunctionWithDefaultImpl(114514i64), "mockedInt64")
    }
    @TestCase
    func NonGenericInterfaceStaticFunctionWithDefaultImpl(): Unit {
        @On(NonGenericInterface.NonGenericInterfaceStaticFunctionWithDefaultImpl(114514i64)).returns("mocked")
        @Expect(NonGenericInterface.NonGenericInterfaceStaticFunctionWithDefaultImpl(114514i64), "mocked")
        @Expect(NonGenericInterface.NonGenericInterfaceStaticFunctionWithDefaultImpl(555), "NonGenericInterfaceStaticFunctionWithDefaultImpl555")
    }
    @TestCase
    func NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(): Unit {
        let c = mock<NonGenericInterface>()
        @On(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(_)).returns("mocked_")
        @On(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(114514i64)).returns("mockedInt64")
        @Expect(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(555), "mocked_")
        @Expect(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(114514i64), "mockedInt64")
    }
    @TestCase
    func NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl(): Unit {
        let c = mock<NonGenericInterface>()
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<Int64>(_)).returns("mocked_")
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<Int64>(114514i64)).returns("mockedInt64")
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<String>(114514i64)).returns("mockedString")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<Int64>(555), "mocked_")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<Int64>(114514i64), "mockedInt64")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithDefaultImpl<String>(114514i64), "mockedString")
    }
    @TestCase
    func NonGenericInterfaceGenericStaticFunctionWithDefaultImpl(): Unit {
        @On(NonGenericInterface.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(_)).returns("mocked_")
        @On(NonGenericInterface.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(114514i64)).returns(
            "mockedInt64")
        @On(NonGenericInterface.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<String>(114514i64)).returns(
            "mockedString")
        @Expect(NonGenericInterface.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(555), "mocked_")
        @Expect(NonGenericInterface.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(114514i64), "mockedInt64")
        @Expect(NonGenericInterface.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<String>(114514i64), "mockedString")
    }
    @TestCase
    func NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl(): Unit {
        let c = mock<NonGenericInterface>()
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(_)).returns("mocked_")
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(114514i64)).returns("mockedInt64")
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<String>(114514i64)).returns("mockedString")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(555), "mocked_")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(114514i64), "mockedInt64")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<String>(114514i64), "mockedString")
    }
}

@Test
class TestExtendNonGenericClassByNonGenericInterface {
    @TestCase
    func NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(): Unit {
        let c = mock<NonGenericClass>()
        @On(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(_)).returns("mocked_")
        @On(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(114514i64)).returns("mockedInt64")
        @Expect(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(555), "mocked_")
        @Expect(c.NonGenericInterfaceInstanceFunctionWithoutDefaultImpl(114514i64), "mockedInt64")
    }
    @TestCase
    func NonGenericInterfaceStaticFunctionWithoutDefaultImpl(): Unit {
        @On(NonGenericClass.NonGenericInterfaceStaticFunctionWithoutDefaultImpl(_)).returns("mocked_")
        @On(NonGenericClass.NonGenericInterfaceStaticFunctionWithoutDefaultImpl(114514i64)).returns("mockedInt64")
        @Expect(NonGenericClass.NonGenericInterfaceStaticFunctionWithoutDefaultImpl(555), "mocked_")
        @Expect(NonGenericClass.NonGenericInterfaceStaticFunctionWithoutDefaultImpl(114514i64), "mockedInt64")
    }
    @TestCase
    func NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl(): Unit {
        let c = mock<NonGenericClass>()
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(_)).returns("mocked_")
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(114514i64)).returns("mockedInt64")
        @On(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<String>(114514i64)).returns("mockedString")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(555), "mocked_")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<Int64>(114514i64), "mockedInt64")
        @Expect(c.NonGenericInterfaceGenericInstanceFunctionWithoutDefaultImpl<String>(114514i64), "mockedString")
    }
    @TestCase
    func NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl(): Unit {
        @On(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<Int64>(_)).returns("mocked_")
        @On(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<Int64>(114514i64)).returns(
            "mockedInt64")
        @On(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<String>(114514i64)).returns(
            "mockedString")
        @Expect(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<Int64>(555), "mocked_")
        @Expect(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<Int64>(114514i64), "mockedInt64")
        @Expect(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithoutDefaultImpl<String>(114514i64), "mockedString")
    }
    @TestCase
    func NonGenericInterfaceGenericStaticFunctionWithDefaultImpl(): Unit {
        @On(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(_)).returns("mocked_")
        @On(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(114514i64)).returns(
            "mockedInt64")
        @On(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<String>(114514i64)).returns(
            "mockedString")
        @Expect(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(555), "mocked_")
        @Expect(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<Int64>(114514i64), "mockedInt64")
        @Expect(NonGenericClass.NonGenericInterfaceGenericStaticFunctionWithDefaultImpl<String>(114514i64), "mockedString")
    }
}
