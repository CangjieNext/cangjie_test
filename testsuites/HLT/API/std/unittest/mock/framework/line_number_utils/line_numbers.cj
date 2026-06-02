/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
package line_number_utils

// NOTE: see verification_failed_report_test and runtime_failure_report_test (LLT)
// this is a helper file
// Exact line numbers in this file are used to test correct error reporting
// make sure not to change linenumbers unnecessarily
// -----------------------------
public func callA(e: Example_LN, times: Int64) : Unit{
    for (i in 0..times) {
        e.a()
    }
}

public func callB(e: Example_LN, times: Int64): Unit {
    for (i in 0..times) {
        e.b()
    }
}

public func callC(e: Example_LN, times: Int64): Unit {
    for (i in 0..times) {
        e.c()
    }
}

public func callA2(e: Example_LN, times: Int64): Unit {
    for (i in 0..times) {
        e.a()
    }
}

public func callB2(e: Example_LN, times: Int64): Unit {
    for (i in 0..times) {
        e.b()
    }
}

public func callC2(e: Example_LN, times: Int64): Unit {
    for (i in 0..times) {
        e.c()
    }
}

public func callOverloadedStr(e: Example_LN): Unit {
    e.overloaded("")
}

public func callSeveralArgsMethod(e: Example_LN): Unit {
    e.severalArgs("abc", "def", 0, 5)
}

public func callP1(e: Example_LN, arg: Int64): Unit {
    e.p(arg)
}

public func callP2(e: Example_LN, arg: Int64): Unit {
    e.p(arg)
}

public func callP3(e: Example_LN, arg: Int64): Unit {
    e.p(arg)
}

// keep this at the bottom for simplicity
public open class Example_LN {
    public open func a(): String {
        ""
    }
    public open func b(): String {
        ""
    }
    public open func c(): String {
        ""
    }

    public open func overloaded(i: Int64): Unit {}
    public open func overloaded(i: String): Unit {}

    public open func severalArgs(string1: String, string2: String, int1: Int64, int2: Int64): Unit {}

    public open func p(i: Int64): String {
        ""
    }

    public open operator func +(str: String): String {
        ""
    }
    public open operator func -(str: String): String {
        ""
    }
    public open operator func [](str1: String): String {
        ""
    }
    public open operator func [](str1: String, value!: String): Unit {}
}

public open class Example1 {
    public open func a(): String {
        ""
    }
    public open func b(): String {
        ""
    }
    public open func c(): String {
        ""
    }

    public open func i1(i: Int64): Unit {}
    public open func i2(i: Int64): Unit {}

    public open func s1(str: String): Unit {}
    public open func s2(str: String): Unit {}
}
