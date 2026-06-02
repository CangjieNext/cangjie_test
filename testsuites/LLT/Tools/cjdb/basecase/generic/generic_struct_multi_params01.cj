// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct Pair<T, U, K> {
    let x: T
    let y: U
    let z: K
    public init(a: T, b: U, c: K) {
        this.x = a
        this.y = b
        this.z = c
    }
}

main() {
    var a = Pair<Int16, Int8, Int32>(1, 2, 3)
    Pair<Int32, Int8, Int16>(2, 3, 4)
    Pair<Int32, Int8, Int16>(2, 3, 4).x
    Pair<Int32, Int8, Int16>(2, 3, 4).y
    Pair<Int32, Int8, Int16>(2, 3, 4).z
    0
}
