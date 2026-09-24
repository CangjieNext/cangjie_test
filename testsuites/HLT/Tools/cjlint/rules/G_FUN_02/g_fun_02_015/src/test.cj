/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Animal {
    public open func speak(name: String, times: Int64): Unit {
        for (i in 0..times) {
            println(name)
        }
    }
}

class Dog <: Animal {
    public override func speak(name: String, times: Int64): Unit {
        println(name)
    }
}

main() {
    let d = Dog()
    d.speak("Tom", 2)
}
