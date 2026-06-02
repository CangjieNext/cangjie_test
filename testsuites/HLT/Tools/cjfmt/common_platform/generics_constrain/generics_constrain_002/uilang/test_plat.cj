/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

import std.collection.*

public specific abstract class Animal {
    public specific func run(): String {
        return "dog animal"
    }
}

public specific class Dog <: Animal {
    public specific func run(): String {
        return "dog run"
    }
}

public specific class Fox <: Animal {
    public specific func run(): String {
        return "fox run"
    }
}

public specific class Zoo<T> where T <: Animal {
    public var animals: ArrayList<Animal> = ArrayList<Animal>()
    public specific func addAnimal(a: T) {
        animals.add(a)
    }

    public specific func allAnimalRuns() {
        for(a in animals) {
            println(a.run())
        }
    }
}
