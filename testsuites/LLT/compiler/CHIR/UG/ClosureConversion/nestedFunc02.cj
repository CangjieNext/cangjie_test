// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %enableFuncInlining %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func foo1<T>(x: T) {
    let y = x
    func goo1<U>() {
        var z = y;
        0
    }

    let a = (goo1<Int64>, goo1<Int32>)
    a[0]()
    goo1<Int8>()
}

main() {
    foo1<Int64>(1)
}
