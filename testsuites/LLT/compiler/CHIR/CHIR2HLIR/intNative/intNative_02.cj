// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT:scan 7 3 11 3 2

class A<T> {
    public var x: T
    public init(y: T) {
        x = y
    }
}

func f1(x: UIntNative) {
    x
}

func f2<T>(x: T) {
    x
}

main(): Int64 {
    var tupleLit: (IntNative, UIntNative) = (3, 2)
    var a = A<IntNative>(7).x
    var b = f1(3)
    var c = f2<UIntNative>(11)
    print("${a} ${b} ${c} ${tupleLit[0]} ${tupleLit[1]}")
    return 0
}
