// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface AddToByte<T> {
    operator func *(other: IntNative): T
}

@OverflowWrapping
func increment<T>(x: T) where T <: AddToByte<T> {
    x * 2
}

@OverflowSaturating
func increment2<T>(x: T) where T <: AddToByte<T> {
    x * 2
}

@OverflowThrowing
func increment3<T>(x: T) where T <: AddToByte<T> {
    x * 2
}

extend IntNative <: AddToByte<IntNative> {}

main() {
    println(increment(IntNative.Min))
    println(increment2(IntNative.Min))
    try {
        println(increment3(IntNative.Min))
    } catch (_: OverflowException) {
        println("catch ovf in increment3")
    }
}

/* SCAN
0
-9223372036854775808
catch ovf in increment3
*/
