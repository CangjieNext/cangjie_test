// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct AA {
    var a: Int8 = 1
    var b = "abc"
    public func test(a: Int16) {
        var d: Int16 = 5
        return a + d + 1
    }
    static func tests(a: Int32) {
        return a + 1
    }
}

main() {
    var aa = AA()
    aa.test(2)
    AA.tests(3)
}
