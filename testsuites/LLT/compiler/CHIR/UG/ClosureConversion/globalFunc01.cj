// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-2: %run %run_opt %n.%suffix

func foo<T>(): Int64 {
    1
}

func goo1<U>(): Int64 {
    var x = foo<U>
    x()
    let y = foo<Int64>
    y()
}

func goo2<U>(): Int64 {
    var y = foo<Int32>
    y()
    var x = foo<U>
    x()
}

main() {
    goo1<Int32>() + goo2<Int64>()
}
