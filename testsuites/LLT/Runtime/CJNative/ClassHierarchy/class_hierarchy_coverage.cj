// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime class hierarchy pass

import std.collection.*

open class Animal {
    let name: String

    init(name: String) {
        this.name = name
    }

    public open func speak(): String {
        "Animal(${name})"
    }
}

class Dog <: Animal {
    init(name: String) {
        super(name)
    }

    public override func speak(): String {
        "Dog:${name}"
    }

    public func fetch(): String {
        "${name} fetches"
    }
}

class Cat <: Animal {
    let color: String

    init(name: String, color: String) {
        super(name)
        this.color = color
    }

    public override func speak(): String {
        "Cat(${color}):${name}"
    }
}

class Bird <: Animal {
    init(name: String) {
        super(name)
    }

    public override func speak(): String {
        "Bird:${name}"
    }
}

func testVirtualDispatch(): Bool {
    let dog = Dog("Rex")
    let cat = Cat("Whiskers", "black")
    let a1: Animal = dog
    let a2: Animal = cat
    a1.speak() == "Dog:Rex" && a2.speak() == "Cat(black):Whiskers"
}

func testDowncast(): Bool {
    let a: Animal = Dog("Buddy")
    match (a) {
        case d: Dog => d.fetch() == "Buddy fetches"
        case _ => false
    }
}

func testMultipleAnimals(): Bool {
    var dogs = ArrayList<Dog>()
    dogs.add(Dog("Fido"))
    dogs.add(Dog("Spot"))
    var count: Int64 = 0
    for (d in dogs) {
        if (d.speak().contains("Dog")) {
            count += 1
        }
    }
    count == 2
}

func testAnimalList(): Bool {
    var animals = ArrayList<Animal>()
    animals.add(Dog("Rover"))
    animals.add(Cat("Luna", "gray"))
    animals.add(Bird("Tweety"))
    var totalSize: Int64 = 0
    for (a in animals) {
        let s = a.speak()
        totalSize += Int64(s.size)
    }
    totalSize > 0
}

main(): Int64 {
    if (!testVirtualDispatch()) {
        return 1
    }
    if (!testDowncast()) {
        return 2
    }
    if (!testMultipleAnimals()) {
        return 3
    }
    if (!testAnimalList()) {
        return 4
    }
    println("runtime class hierarchy pass")
    0
}
