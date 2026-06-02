// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -o %output 2>&1 | compare %f
// ASSERT: scan the upper bound 'Int32' of generic parameter 'Generics-T2' must be class or interface
// ASSERT: scan cannot convert an integer literal to type 'Generics-T2'

var x: Int32 = 1
func foo<T1, T2, T3>(a: T1) where T2 <: Int32 {
    var b = a
    var c: T2 = 2
    x *= -c
}

main() {
    foo<Int32, Int32, Int32>(1)
    foo<Int16, Int32, Rune>(2)
    foo<Int8, Int32, Bool>(-1)
    return x + 8
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
