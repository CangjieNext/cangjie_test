/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Foo<X> {
    let width: X
    let height: X

    public init(width:X, height: X) {
        this.width = width
        this.height = height
    }
    public prop b: X {
        get() {
            println("get")
            width
        }
    }
}

main() {
    var x = Foo<Int64>(6,8)
    let y = x.b + 1
}
