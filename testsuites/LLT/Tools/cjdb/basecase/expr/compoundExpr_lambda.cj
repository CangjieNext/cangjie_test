// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


var member = 1

class AA {
    var f1: (Int64) -> Int64 = {a: Int64 => a + 1}
    let f2: (Int64, (Int64) -> Int64) -> Int64 = {a: Int64, f: (Int64) -> Int64 => f(a) + member}
}

var f1: (Int64) -> Int64 = {a: Int64 => a + 1}
let f2: (Int64, (Int64) -> Int64) -> Int64 = {a: Int64, f: (Int64) -> Int64 => f(a) + member}

main() {
    var cla = AA()
    f2(1, f1)
    cla.f2(1, cla.f1)
    0
}
