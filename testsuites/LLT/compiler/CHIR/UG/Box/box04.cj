// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-1: %run %run_opt %n.%suffix

// Interger -> A
class A<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

main() {
    let res = A<Int64>(1)
    res.a
}
