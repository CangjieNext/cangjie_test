/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.runtime.*

open class Father {
    public var a0: Int64 = 1
}

class Son <: Father {
    public func WriteRefField(ref: Father): Unit {
        a1 = ref
    }
    public func Show(): Int64 {
        return a1.a0
    }
    private var a1: Father = Father()
}

struct Rcd {
    public var a0: Int64 = 2
    public var a1: Array<Son> = [Son(), Son(), Son()]
}

class Daughter <: Father {
    public var a1: Rcd = Rcd()
}

// daughter -> son, son -> daughter
main(): Int64 {
    var son: Son = Son()
    var daughter: Daughter = Daughter()
    daughter.a0 = 3
    daughter.a1.a1[1] = son
    son.WriteRefField(daughter)
    var oldDaughter: Daughter = daughter
    daughter = Daughter()
    GC()
    if (son.Show() != Int64(3)) {
        print("fail: son.a1 is not pointed to daughter!")
        return 0
    }
    if (oldDaughter.a1.a1[1].Show() != Int64(3)) {
        print("fail: oldDaughter.a1.a1[1] is not pointed to son!")
        return 0
    }
    print("success")
    return 0
}
