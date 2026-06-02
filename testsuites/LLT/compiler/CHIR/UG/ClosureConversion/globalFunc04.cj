// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-2: %run %run_opt %n.%suffix

class A<XXX> {
    var x: XXX
    init(y: XXX) {
        x = y
    }
    func foo<YYY>(y: YYY, z: XXX) {
        z
    }
    func goo() {
        var a = foo<Int8> // generate a lambda expr: _CN7default1AIG3XXX3gooEvlambda-17-17E
        a(1, x)
    }
}

main() {
    var a = A<Int64>(1)
    var b = a.foo<Int32>
    b(0, 1) + a.goo()
}
