/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sort.*

class Person <: Comparable<Person> {
    public let name: String
    public let age: Int32

    public init(name: String, age: Int32) {
        this.name = name
        this.age = age
    }

    public func compare(rhs: Person): Ordering {
        return this.age.compare(rhs.age)
    }

    public operator func ==(rhs: Person): Bool {
        return this.name == rhs.name && this.age == rhs.age
    }

    public operator func !=(rhs: Person): Bool {
        return !(this == rhs)
    }

    public operator func <(rhs: Person): Bool {
        return this.age < rhs.age
    }

    public operator func >(rhs: Person): Bool {
        return this.age > rhs.age
    }

    public operator func <=(rhs: Person): Bool {
        return this.age <= rhs.age
    }

    public operator func >=(rhs: Person): Bool {
        return this.age >= rhs.age
    }
}

func personAge(person: Person): Int32 {
    return person.age
}

main(): Int64 {
    var naturalUnstable = [Person("c", 3), Person("a", 1), Person("b", 2)]
    var naturalStable = [Person("c", 3), Person("a", 1), Person("b", 2)]
    unstableSort(naturalUnstable)
    stableSort(naturalStable)
    if (naturalUnstable[0].age != 1 || naturalUnstable[1].age != 2 || naturalUnstable[2].age != 3) {
        return 1
    }
    if (naturalStable[0].age != 1 || naturalStable[1].age != 2 || naturalStable[2].age != 3) {
        return 2
    }

    var keyed = [Person("first-two", 2), Person("only-one", 1), Person("second-two", 2)]
    sort(keyed, key: personAge, stable: true)
    if (keyed[0].name != "only-one" || keyed[1].name != "first-two" || keyed[2].name != "second-two") {
        return 3
    }
    return 0
}
