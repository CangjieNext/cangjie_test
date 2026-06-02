// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    func f1(x: Int64) {
        x
    }
    var a1 = f1(2)
    let aa: Int32 = 1
    func f2() {
        return Int64(aa)
    }
    var a2 = f2()
    var bb = 2
    func f3() {
        return Int64(aa) + bb + 3
    }
    var a3 = f3()
    0 // expr f1(1) + f2() + f3()
}
