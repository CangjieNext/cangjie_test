// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var a: (a: (Int64, Int64), override: Int64)
    init() {
        a = ((1, 1), 1)
    }
}

main() {
    var temp = A()
    return temp.a[0][0] + temp.a[0][1] - 2 * temp.a[1]
}
