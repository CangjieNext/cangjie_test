// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan Exception
// ASSERT: scan throw.cj:20
// ASSERT: scan throw.cj:26
// ASSERT: scan throw.cj:34

class A <: Exception {}

class B <: Exception {}

func Func1() {
    throw A()
}

func Func2(): Int64 {
    var result: Int64 = 4;
    try {
        Func1()
    } catch (b: B) {
        return result
    }
    return result
}

main(): Int64 {
    var ret: Int64 = Func2()
    return 0
}
