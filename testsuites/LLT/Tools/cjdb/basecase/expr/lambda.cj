// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let f1 = {a: Int64, b: Int64 => a + b}

func foo(a: Int32, b: Int32) {
    return a - b
}
var c = 3

main() {
    var f2 = {a: Int32 => a + Int32(c)}
    f1(1, 2)
    f2(2)
    var a1 = foo
    a1(1, 2)
}
