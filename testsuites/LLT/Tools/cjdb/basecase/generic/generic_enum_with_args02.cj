// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor<T1, T2> {
    | Red(T1)
    | Blue(T2)

    func print<T1>(a: T1) {
        return a
    }
}
var gb = Blue<Bool, Int64>(1)
var gr = RGBColor<Int64, Int8>.Red(1)
main() {
    var lb = Blue<Bool, Int64>(1)
    var lr = RGBColor<Int64, Int8>.Red(1)
    lb.print<Int64>(1)
    0
}
