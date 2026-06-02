// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor<T1, T2> {
    | Red
    | Blue
    func print<T1>(a: T1) {
        return a
    }
    func print2<T2>(a: T2) {
        return a
    }
    func print3<T1, T2>(a: T1, b: T2) {
        return a
    }
}

main() {
    var lb = RGBColor<Int64, Bool>.Blue
    var lr = RGBColor<Bool, Int32>.Red
    lb.print<Int64>(1)
    lr.print2<Int32>(1)
    // lr.print3<Bool,Int32>(false,1)
    0
}
