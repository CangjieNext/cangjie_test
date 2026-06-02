// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct Rectangle<T> {
    let width2: T
    let length2: T
    var id: UInt64 = 0
    init(side: T) {
        this(side, side)
    }
    init(width2: T, length2: T) {
        this.width2 = width2
        this.length2 = length2
    }
}

main() {
    let a = Rectangle<UInt32>(2)
    let b = Rectangle<UInt64>(2, 3)
    0
}
