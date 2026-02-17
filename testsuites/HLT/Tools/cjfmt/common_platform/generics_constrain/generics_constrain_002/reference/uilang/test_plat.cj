/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

import std.collection.*

specific public abstract class Animal {
    specific public func run(): String {
        return "dog animal"
    }
}

specific public class Dog <: Animal {
    specific public func run(): String {
        return "dog run"
    }
}

specific public class Fox <: Animal {
    specific public func run(): String {
        return "fox run"
    }
}

specific public class Zoo<T> where T <: Animal {
    public var animals: ArrayList<Animal> = ArrayList<Animal>()
    specific public func addAnimal(a: T) {
        animals.add(a)
    }

    specific public func allAnimalRuns() {
        for (a in animals) {
            println(a.run())
        }
    }
}
