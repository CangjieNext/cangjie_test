/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public open class Animal {
    public open func sound(): Unit {
        println("generic")
    }
}

public abstract class Shape {
    public func desc(): Unit {
        println("shape")
    }
}

class Dog <: Animal {
    public override func sound(): Unit {
        println("woof")
    }
}

main() {
    Dog().sound()
}
