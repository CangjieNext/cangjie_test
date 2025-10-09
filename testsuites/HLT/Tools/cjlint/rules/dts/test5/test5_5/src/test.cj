class Foo {
    private var a : Float64 = 4.9E-324
    public mut prop b : Float64 {
    get() {
        println("get")
        a
    }
    set(value) {
        println("set")
        a = value
    }
    }
}

main() {
    var x = Foo()
    let y  = x.b + 1.2
    x.b = y
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
