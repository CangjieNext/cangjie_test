/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

abstract class abs1 {}

class def_class1 <: abs1 {
    public func get(): Int32 {
        return 1
    }
}

abstract class abs2 <: Object {
    public open func get(): Int32 {
        return 2
    }
}

class def_class2 <: abs2 {
    public override func get(): Int32 {
        return 2
    }
}

public class ext3 <: Object {
    public func get(): Int32 {
        return 3
    }
}

class int4 <: Object {
    public func get(): Int32 {
        return 4
    }
}

open class Base5 {
    public open func get(): Int32 {
        return 5
    }
}

open class Base6 <: Object {
    public open func get(): Int32 {
        return 6
    }
}

main(): Int64 {
    var myArray: ArrayList<Object> = ArrayList<Object>(0)

    myArray.add(def_class1())
    myArray.add(def_class2())
    myArray.add(ext3())
    myArray.add(int4())
    myArray.add(Base5())
    myArray.add(Base6())

    if (myArray.isEmpty()) {
        return 1
    }

    if (myArray.size != 6) {
        return 1
    }

    return 0
}
