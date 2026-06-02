// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface AddToByte<T> {
    operator func +(other: UIntNative): T
}

@OverflowWrapping
func increment<T>(x: T) where T <: AddToByte<T> {
    x + 1
}

@OverflowSaturating
func increment2<T>(x: T) where T <: AddToByte<T> {
    x + 2
}

@OverflowThrowing
func increment3<T>(x: T) where T <: AddToByte<T> {
    x + 3
}

extend UIntNative <: AddToByte<UIntNative> {}

main() {
    println(increment(UIntNative.Max))
    println(increment2(UIntNative.Max))
    try {
        println(increment3(UIntNative.Max))
    } catch (_: OverflowException) {
        println("catch ovf in increment3")
    }
}

struct C <: AddToByte<C> {
    public C(let a: UIntNative) {}
    public operator func +(b: UIntNative): C {
        C(a + b)
    }
}

/* SCAN
0
18446744073709551615
catch ovf in increment3
*/
