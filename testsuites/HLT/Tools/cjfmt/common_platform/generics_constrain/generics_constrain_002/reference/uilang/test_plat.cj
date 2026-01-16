/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

import std.collection.*

platform public abstract class Animal {
    platform public func run(): String {
        return "dog animal"
    }
}

platform public class Dog <: Animal {
    platform public func run(): String {
        return "dog run"
    }
}

platform public class Fox <: Animal {
    platform public func run(): String {
        return "fox run"
    }
}

platform public class Zoo<T> where T <: Animal {
    public var animals: ArrayList<Animal> = ArrayList<Animal>()
    platform public func addAnimal(a: T) {
        animals.add(a)
    }

    platform public func allAnimalRuns() {
        for (a in animals) {
            println(a.run())
        }
    }
}
