// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-1: %run %run_opt %n.%suffix

class A<XXX> {
    var x: XXX
    init(y: XXX) {
        x = y
    }
    func foo<YYY>(y: YYY, z: XXX) {
        z
    }
}

main() {
    var a = A<Int64>(1)
    var b = a.foo<Int32>
    b(0, 1)
}
