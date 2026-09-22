/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Builder {
    public func reset(): Builder {
        return this
    }
    public func set(n: Int64): Builder {
        return this
    }
    public func sum(): Int64 {
        return 0
    }
}

main() {
    let built = Builder()
        .reset()
        .set(1)
        .set(2)
        .set(3)
        .set(4)
        .set(5)
        .set(6)
        .set(7)
        .set(8)
        .set(9)
        .set(10)
        .set(11)
        .set(12)
        .set(13)
        .set(14)
        .set(15)
    let c1 = Builder()
        .reset() /* r */ .set(1) /* s */ .set(2)
        .set(3)
        .set(4)
        .set(5)
        .set(6)
        .set(7)
        .set(8)
        .set(9)
        .set(10)
        .set(11)
        .set(12)
        .set(13)
    let small = Builder().reset().set(1).set(2)
    let two = Builder() // trailing comment after chain
    let four = Builder().set(1).set(2)
    println(built.sum())
    println(c1.sum())
    println(small.sum())
    println(two.sum())
    println(four.sum())
}
