// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var i: Int16 = 3
    func test() {
        i++
        i--
    }
}
main(): Int64 {
    var aa = A()
    aa.test()
    aa.i++
    aa.i--
    0
}
