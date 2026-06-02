// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let f1 = {a: Int64 => a}
var c = 3
class A {
    let f = {a: Int64 => a}
    func test() {
        var ff = {a: Int32 => a + Int32(c)}
        f(2) + Int64(ff(2))
    }
}
main() {
    f1(1)
    A().test()
}
