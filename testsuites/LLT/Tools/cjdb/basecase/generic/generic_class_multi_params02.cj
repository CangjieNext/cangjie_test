// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Pair<T, U> {
    let x: T
    let y: U
    public init(a: T, b: U) {
        this.x = a
        this.y = b
    }
}

main() {
    var a = Pair<Int16, Int8>(1, 2)
    0
}
