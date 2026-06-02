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
    throw A()
    return 20
}

main(): Int64 {
    var v1: Int64 = 0
    try {
        v1 = Func1()
    } catch (_) {
        v1 = 30
    } finally {
        v1 = 10
    }
    if (v1 == 10) {
        print("10")
    }
    return 0
}
