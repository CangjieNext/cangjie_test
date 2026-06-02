/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var a1: IntNative = -1
var b1: UIntNative = 0

main(): Int64 {
    var a = foo<IntNative>(a1)
    var b = foo<UIntNative>(b1)
    if (a != -1) {
        return 1
    }
    if (b != 0) {
        return 2
    }
    return 0
}

func foo<T>(x: T) {
    return x
}
