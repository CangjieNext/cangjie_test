/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

import std.collection.*

common public abstract class Animal {
    common public func run(): String
    public init() {}
}

common public class Dog <: Animal {
    common public func run(): String {
        return "dog run"
    }
    public init() {}
}

common public class Fox <: Animal {
    common public func run(): String {
        return "fox run"
    }
    public init() {}
}

common public class Zoo<T> where T <: Animal {
    public var animals: ArrayList<Animal> = ArrayList<Animal>()
    common public func addAnimal(a: T) {
        animals.add(a)
    }
    public init() {}
    common public func allAnimalRuns(): Unit
}
