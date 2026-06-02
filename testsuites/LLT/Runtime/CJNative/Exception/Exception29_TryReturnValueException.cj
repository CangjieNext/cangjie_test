// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 0

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

func Func1() {
    throw A()
}

var processResult: Int64 = 99

main(): Int64 {
    var ret: Int64 = Run()
    if (ret == 0) {
        print("0")
    } else {
        print("fail")
    }
    return 0
}

func Run(): Int64 {
    var res: Int64 = 2;
    try {
        res = Func2()
    } catch (b: B) {
        processResult -= 10
    }
    if (res == 5 && processResult == 95) {
        return 0
    }
    return res
}

func Func2(): Int64 {
    var result: Int64 = 4;
    try {
        Func1()
        return result
    } catch (a: A) {
        println("A")
    } catch (b: B) {
        result = 3
        return result
    } catch (c: C) {
        result = 3
        return result
    } finally {
        processResult -= 4
        result++
        return result
    }
    return result
}
