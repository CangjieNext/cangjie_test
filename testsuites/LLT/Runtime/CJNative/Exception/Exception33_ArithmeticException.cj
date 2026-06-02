// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 

var temp: Int64 = 1

func f1() {
    return temp - 1
}

main(): Int64 {
    try {
        var a: Int64 = 100;
        var b: Int64 = f1();
        var c: Int64 = a / b;
    } catch (e: ArithmeticException) {
        return 0
    }
    return 1
}
