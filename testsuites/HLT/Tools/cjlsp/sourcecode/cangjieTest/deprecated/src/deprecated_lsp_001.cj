/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

@Deprecated
interface Flyable {
    func fly(): Unit
}

@Deprecated
class Bird <: Runing {
    public func run(): Unit {
        println("Bird flying")
    }
}

@Deprecated
struct Airplane <: Runing {
    public func run(): Unit {
        println("Airplane flying")
    }
}

@Deprecated
func fly(item: Runing): Unit {
    item.run()
}

@Deprecated
enum Color {
    | RED
    | @Deprecated
    Blue(UInt8)
}

func testcase01() {
    @Deprecated
    let bird = Bird()
    let airplane = Airplane()
    fly(bird)
    fly(airplane)
    let r = Color.RED
    let test = Color.Blue(1)
}
