/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public func a(): String {
    "original value `a`"
}

public func test123(x: Int64, y: String): String {
    x.toString() + y
}

public func test1234(): String {
    "x.toString() + y"
}

public func test1235(): String {
    "x.toString() + y"
}

var __ = @EnsurePreparedToMock {
    => return a();
}

class A {
    static func test() {
        return @EnsurePreparedToMock {=> return test1234()}
    }
    static func test2() {
        return @EnsurePreparedToMock {=> return test1235()}()
    }
}

@Test
public class TestA {
    let EnsurePreparedToMock = @EnsurePreparedToMock {
        =>
        println("--- inside an @EnsurePreparedToMock-annotated lambda ---")
        return (((a())))
    }
    @TestCase
    func case1(): Unit {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return (a())}
            ConfigureMock.stubFunction(stubCall, [], "a", "a", #"a()"#, 27)
        }().returns("--- mocked value 1 ---")
        println(a())
    }

    @TestCase
    func case2(): Unit {
        {
            => ConfigureMock.stubFunction(@EnsurePreparedToMock {=> return (a())}, [], "a", "a", #"a()"#, 27)
        }().returns("--- mocked value 2 ---")
        println(a())
    }

    @TestCase
    func case3(): Unit {
        {
            => ConfigureMock.stubFunction(__, [], "a", "a", #"a()"#, 27)
        }().returns("--- mocked value 3 ---")
        println(a())
    }

    @TestCase
    func case4(): Unit {
        {
            => ConfigureMock.stubFunction(EnsurePreparedToMock, [], "a", "a", #"a()"#, 27)
        }().returns("--- mocked value 4 ---")
        println(a())
    }

    @TestCase
    func case5(): Unit {
        {
            =>
            let matcher0 = Matchers.default(11)
            let matcher1 = Matchers.eq("polo")
            let stubCall = @EnsurePreparedToMock {=> return (test123(matcher0.value(), matcher1.value()))}
            ConfigureMock.stubFunction(stubCall,
                [matcher0.withDescription(#"test123"#), matcher1.withDescription(#"eq("polo")"#)], Option<String>.None,
                "test123", #"test123(AA, "polo")"#, 64)
        }().returns("--- mocked value 5 ---")
        println(test123(11, "polo"))
        println(test123(12, "--- polo 2 ---"))
        println(test123(111, "--- not polo ---"))
    }

    @TestCase
    func case6(): Unit {
        {
            => ConfigureMock.stubFunction(A.test(), [], "test", "test", #"test()"#, 27)
        }().returns("--- mocked value 6 ---")
        println(test1234())
    }

    @TestCase
    func case7(): Unit {
        {
            => ConfigureMock.stubFunction(A.test2, [], "test", "test", #"test()"#, 27)
        }().returns("--- mocked value 7 ---")
        println(test1235())
    }
}

/* SCAN-IN
--- mocked value 1 ---
--- mocked value 2 ---
--- mocked value 3 ---
--- inside an @EnsurePreparedToMock-annotated lambda ---
--- mocked value 4 ---
--- mocked value 5 ---
12--- polo 2 ---
111--- not polo ---
--- mocked value 6 ---
--- mocked value 7 ---
 */
