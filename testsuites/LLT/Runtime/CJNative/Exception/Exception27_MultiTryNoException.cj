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
    // donoting
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
    } catch (_) {
        processResult -= 10
    }
    if (res == 1 && processResult == 95) {
        return 0
    }
    return res
}

func Func2(): Int64 {
    var result: Int64 = 4;
    try {
        try {
            Func1()
        } catch (b: B) {
            result = 3
        } finally {
            processResult--
        }
        processResult--
    } catch (c: C) {
        result = 3
    } finally {
        processResult--
        result = 1
    }
    processResult--
    return result
}
