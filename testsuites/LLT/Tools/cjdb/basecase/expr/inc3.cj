// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct A {
    var i: UInt8 = 3
    mut func test() {
        i++
        i--
    }
    func testa() {
        this.i
    }
}

main(): Int64 {
    var aa = A()
    aa.test()
    aa.testa()
    aa.i++
    aa.i--
    0
}
