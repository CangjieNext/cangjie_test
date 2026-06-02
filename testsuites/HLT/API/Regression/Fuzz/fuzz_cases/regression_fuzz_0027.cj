/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.collection.*

class Test {
    public var t0: Int32 = 1
}

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var a3: Test = Test()
}

open class Father {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 2
    public var r0: Rcd = Rcd()
}

open class Son <: Father {
    public var a3: Int32 = 3
    public var a4: Test = Test()
    public var a5: Int32 = 5
    public var a6: Test = Test()
    public var r1: Rcd = Rcd() // struct r1 is flattened in Son
}

let objIndexArray = ArrayList<Int64>()

func AssureLivenessAfterGC(indexArray: ArrayList<Int64>): Bool {
    let failIndexes = ArrayList<Int64>()
    var i: Int64 = 0
    while (i < indexArray.size()) {
        if (CheckWatchedObjectIsFreed(indexArray.get(i).getOrThrow()) != true) {
            failIndexes.add(indexArray.get(i).getOrThrow())
        }
        i++
    }

    if (failIndexes.size() > 0) {
        i = 0
        print("fail: obj indexes: ")
        while (i < failIndexes.size()) {
            print(failIndexes.get(i).getOrThrow().toString() + " ")
            i++
        }
        print("are not freed after GC!\n")
        return false
    }
    return true
}

func TestObjectGC(): Bool {
    objIndexArray.clear()
    ResetWatchedObjects()
    var s1: Son = Son()
    var r1: Rcd = Rcd()
    var o1: Int64 = RegisterWatchedObject(s1)
    objIndexArray.add(o1)
    var o2: Int64 = RegisterWatchedObject(r1.a3)
    objIndexArray.add(o2)
    var o3: Int64 = RegisterWatchedObject(s1.r1.a1)
    objIndexArray.add(o3)
    var o4: Int64 = RegisterWatchedObject(s1.a1)
    objIndexArray.add(o4)

    s1 = Son() // set previous s1 unreachable
    r1 = Rcd() // set previous r1 unreachable

    sleep(Duration.second * 300) // trigger Timeout GC

    return AssureLivenessAfterGC(objIndexArray)
}

main(): Int64 {
    if (TestObjectGC() == true) {
        print("success")
    }
    return 0
}
// ASSERT: scan sema_no_match_operator_function_call
// ASSERT: scan sema_undeclared_identifier
