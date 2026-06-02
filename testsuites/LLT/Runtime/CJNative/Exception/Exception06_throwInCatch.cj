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

func Func1(): Int64 {
    try {
        throw A()
    } catch (a: A) {
        throw B()
    }
    return 0
}

func Func2(): Int64 {
    var tmp: Int64 = 0
    try {
        tmp = Func1()
    } catch (b: B) {
        return 10
    } catch (_) {
        return 20
    }
    return 30
}

main(): Int64 {
    var v1: Int64 = 0
    try {
        v1 = Func2()
    } catch (_) {
        v1 = 30
    }
    if (v1 == 10) {
        print("10")
    } else {
        print("30")
    }
    return 0
}
