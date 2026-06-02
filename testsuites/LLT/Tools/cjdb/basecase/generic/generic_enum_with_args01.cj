// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor<T> {
    | Red
    | Blue(T)
    func print<T>(a: T) {
        return a
    }
}
var gb = Blue<Int64>(1)
var gr = RGBColor<Int32>.Red

main() {
    var lb = Blue<Int64>(1)
    var lr = RGBColor<Int32>.Red
    lb.print<Int64>(1)
    0
}
