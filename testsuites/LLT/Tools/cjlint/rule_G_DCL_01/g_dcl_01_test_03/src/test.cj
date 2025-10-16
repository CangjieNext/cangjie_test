// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Unit {
    var name = ""
    var fn = {=>
        var name = "Zhang"  // Shadow
        var fn1 = {=>
            var name = "Zhang"  // Shadow
            println(name)
        }
        println(name)
    }
    println(name)  // prints ""
    fn()  // prints "Zhang"
}