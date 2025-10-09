// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.interfaceDecl

/**
 * interface Flyable
 */
public interface Flyable {
    func fly(): Unit
}

/**
 * class Bird
 */
public class Bird <: Flyable {
    public func fly(): Unit {
        println("Bird flying")
    }
}

/**
 * class Bat
 */
public class Bat <: Flyable {
    public func fly(): Unit {
        println("Bat flying")
    }
}

/**
 * class Airplane
 */
public class Airplane <: Flyable {
    public func fly(): Unit {
        println("Airplane flying")
    }
}

/**
 * func fly
 */
public func fly(item: Flyable): Unit {
    item.fly()
}

main() {
    let bird = Bird()
    let bat = Bat()
    let airplane = Airplane()
    fly(bird)
    fly(bat)
    fly(airplane)
}
