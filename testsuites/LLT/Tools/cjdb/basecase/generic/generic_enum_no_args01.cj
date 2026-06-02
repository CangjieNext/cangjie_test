// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor<T> {
    | Red
    | Blue
    func print<T>(a: T) {
        return a
    }
}

main() {
    var lb = RGBColor<Int64>.Blue
    var lr = RGBColor<Int8>.Red
    lb.print<Int64>(1)
    0
}
