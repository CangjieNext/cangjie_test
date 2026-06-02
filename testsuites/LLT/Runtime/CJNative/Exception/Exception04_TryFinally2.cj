// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

func func1(): Int64 {
    var x: Int64 = 5;
    try {
        return x + x // Return 10.
    } catch (_) {
    // Caught. nothing to do
    } finally {
        x = 20
    } // The return value is 10 but not 20.
    return 20
}

func func2(): Int64 {
    var x = 10;
    try {
        return x + x; // Return 10.
    } catch (_) {
    // Caught. nothing to do
    } finally {
        x = 5
        return x + x;
    } // The return value is 10 but not 20.
    return 20
}

// try {e1} catch catchPattern {e2} finally {e3}

// e1 not throw, e2 not run, e3 no throw
func func3(): Int64 {
    var x = 5;
    try {
        x = x + x
    } catch (_) {
        x = 20
    } finally {
        return x;
    } // The return value is 10.
    return 20
}

// e1 not throw, e2 not run, e3 throw A
func func4(): Int64 {
    var x = 5;
    try {
        x = x + x
    } catch (_) {
        x = 20
    } finally {
        throw A()
        return x
    }
    return 20
}

// e1 throw A, e2 catch, e3 throw B
func func5(): Int64 {
    var x = 5
    try {
        throw A()
    } catch (_) {
        x = 20
    } finally {
        throw B()
    }
    return 0
}
// e1 throw A, e2 not catch, e3 throw B
func func6(): Int64 {
    var x = 5
    try {
        throw A()
    } catch (b: B) {
        x = 20
    } finally {
        throw B()
    }
    return 0
}

main(): Int64 {
    var res: Int64 = 10
    res = func1()
    if (!res == 10) {
        print("20")
    }

    res = func2()
    if (!res == 10) {
        print("20")
    }

    res = func3()
    if (!res == 10) {
        print("20")
    }

    try {
        res = func4()
    } catch (a: A) {
    } catch (_) {
        print("20")
    }

    try {
        res = func5()
    } catch (b: B) {
    } catch (_) {
        print("20")
    }

    try {
        res = func6()
    } catch (b: B) {
    } catch (_) {
        print("20")
    }
    print("10")
    return 0
}
