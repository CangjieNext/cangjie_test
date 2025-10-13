// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test_package

import std.collection.*

private class Locale {}

private class Test {
    Test(let id!: String = "", let locale!: Locale = Locale(), let wantLocale!: Locale = Locale(),
        let wantString!: String = "111", let wantBool!: Bool = false) {}
    public func prefixTest() {}
}

public func goo() {
    let tests = ArrayList<Test>([Test()])
    for (tt in tests) {
        tt.prefixTest()
    }
}