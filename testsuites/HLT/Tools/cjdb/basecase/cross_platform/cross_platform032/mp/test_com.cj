/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

import std.collection.*

public common abstract class Animal {
    public common func run(): String
    public init() {}
}

public common class Dog <: Animal { 
    public init() {} 
}

public common class Zoo<T> where T <: Animal {
    public var animals: ArrayList<Animal> = ArrayList<Animal>()
    public common func addAnimal(a: T) {
        animals.add(a)
    }

    public common func allAnimalRuns(): Unit
    public init() {}
}