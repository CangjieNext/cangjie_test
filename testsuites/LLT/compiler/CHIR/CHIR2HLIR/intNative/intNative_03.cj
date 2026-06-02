// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT:scan 13 5

interface I<T> {
    func test(x: T): T
}

extend IntNative <: I<IntNative> {
    public func test(x: IntNative): IntNative {
        return this + x + 3
    }
}

extend UIntNative <: I<UIntNative> {
    public func test(x: UIntNative): UIntNative {
        return this - x - 3
    }
}

main(): Int64 {
    var a: IntNative = 6
    var b: UIntNative = 9
    print("${a.test(4)}  ${b.test(1)}")
    return 0
}
