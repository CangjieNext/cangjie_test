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

func Func1(): Int64 {
    throw A()
    return 0
}

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
        res = 11
    }
    if (res == 1) {
        res = 0
    }
    return res
}

func Func2(): Int64 {
    var result: Int64 = 4;
    var processResult: Int64 = 99
    var tmp: Int64 = 0
    try {
        try {
            tmp = Func1()
        } finally {
            if (processResult == 99) {
                processResult--;
            }
        }
        processResult -= 10
    } catch (b: B) {
        result = 3
    } catch (a: A) {
        if (processResult == 98) {
            processResult--;
            result = 1
        }
    } finally {
        if (processResult == 97) {
            processResult--;
        }
    }
    if (processResult == 96) {
        processResult--;
    }
    if (processResult == 95 && result == 1) {
        return result
    } else {
        return 3
    }
}
