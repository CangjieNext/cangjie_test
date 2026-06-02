// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface AddToByte<T> {
    operator func *(other: Int8): T
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

extend Int8 <: AddToByte<Int8> {}

main() {
    println(increment(Int8.Min))
    println(increment2(Int8.Min))
    try {
        println(increment3(Int8.Min))
    } catch (_: OverflowException) {
        println("catch ovf in increment3")
    }
}

/* SCAN
0
-128
catch ovf in increment3
*/
