/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public var name: String = "Alice"
}

class Derived1 <: Base {
    public var age: UInt8 = 18
}

class Derived2 <: Base {
    public var gender: String = "female"
}

main(): Int64 {
    let base1: Base = Base()
    let base2: Base = Derived1()
    let base3: Base = Derived2()

    let derived1: Derived1 = Derived1()
    let derived2: Derived2 = Derived2()

    var castOP = base1 as Base // castOP = Option<Base>.Some(Base())
    var castOP1 = base1 as Derived1 // castOP1 = Option<Derived1>.None
    var castOP2 = base1 as Derived2 // castOP2 = Option<Derived1>.None
    var castOP3 = base2 as Base // castOP3 = Option<Base>.Some(Derived1())
    var castOP4 = base2 as Derived1 // castOP4 = Option<Derived1>.Some(Derived1())
    var castOP5 = base2 as Derived2 // castOP5 = Option<Derived2>.None
    var castOP6 = base3 as Base // castOP6 = Option<Base>.Some(Derived2())
    var castOP7 = base3 as Derived1 // castOP7 = Option<Derived1>.None
    var castOP8 = base3 as Derived2 // castOP8 = Option<Derived2>.Some(Derived2())

    var castOP9 = derived1 as Base // castOP9 = Option<Base>.Some(Derived1())
    var castOP10 = derived1 as Derived1 // castOP10 = Option<Derived1>.Some(Derived1())
    var castOP11 = derived1 as Derived2 // castOP11 = Option<Derived2>.None
    var castOP12 = derived2 as Base // castOP12 = Option<Base>.Some(Derived2())
    var castOP13 = derived2 as Derived1 // castOP13 = Option<Derived1>.None
    var castOP14 = derived2 as Derived2 // castOP14 = Option<Derived2>.Some(Derived2())

    return 0
}
