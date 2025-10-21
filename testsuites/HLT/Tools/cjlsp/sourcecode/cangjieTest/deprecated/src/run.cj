/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

@Deprecated
interface Runing {
    func run(): Unit
}

@Deprecated
class Dog <: Runing {
    public func run(): Unit {
        println("Dog Runing")
    }
}

@Deprecated
struct Car <: Runing {
    public func run(): Unit {
        println("Car Runing")
    }
}

@Deprecated
func run(item: Runing): Unit {
    item.run()
}

@Deprecated
enum RGBColor {
    | RED
    | @Deprecated
    Black(UInt8)
}

