/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

import std.collection.*

public platform abstract class Animal {
    public platform func run(): String {
        return "dog animal"
    }
}

public platform class Dog <: Animal {}

public platform class Zoo<T> where T <: Animal {
    public platform func addAnimal(a: T) {
        animals.add(a)
    }

    public platform func allAnimalRuns() {
        for(a in animals) {
            println(a.run())
        }
    }
}
