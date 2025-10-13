/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: check_array.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt check_array.cj -o libcangjie-check.%middle
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -L. -lcangjie-check -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import A.*
import std.collection.*
import std.runtime.*

let tmpCheck: CheckArray = CheckArray()

class Test <: TestBase {
    public var t0: Int32 = 1
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var a3: Test = Test()
}

open class Father <: TestBase {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 2
    public var r0: Rcd = Rcd()
}

class Son <: Father {
    public var a3: Int32 = 3
    public var a4: Test = Test()
    public var a5: Int32 = 5
    public var a6: Test = Test()
    public var r1: Rcd = Rcd() // struct r1 is flattened in Son
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

func TestObjectGC(): Bool {
    tmpCheck.Reset()
    var s1: Son = Son()
    var r1: Rcd = Rcd()

    tmpCheck.RegisterIndex(s1)
    tmpCheck.RegisterIndex(r1.a3)
    tmpCheck.RegisterIndex(s1.r1.a3)
    tmpCheck.RegisterIndex(s1.a1)

    GC()

    // 2 + 1 + 1 + 1 == 5
    if ((Int64(s1.a2) + Int64(r1.a3.t0) + Int64(s1.r1.a3.t0) + Int64(s1.a1.t0)) != Int64(5)) {
        print("fail: sum is not 5!")
        return false
    }

    s1 = Son() // set previous s1 unreachable
    r1 = Rcd() // set previous r1 unreachable

    GC()
    sleep(Duration.second * 3) // for non-blocking gc, wait it done
    while (true) {
        if (tmpCheck.Check()) {
            break
        }
    }
    return tmpCheck.Check()
}

func TestArrayGC(): Bool {
    tmpCheck.Reset()
    var objectArray: Array<Test> = [Test(), Test(), Test(), Test(), Test(), Test()]
    var structArray: Array<Rcd> = [Rcd(), Rcd()]

    tmpCheck.RegisterIndex(objectArray[0])
    tmpCheck.RegisterIndex(structArray[0].a3)

    GC()

    // 1 + 2 == 3
    if ((Int64(objectArray[2].t0) + Int64(structArray[1].a1)) != Int64(3)) {
        print("fail: sum is not 3!")
        return false
    }

    objectArray = [Test()] // set previous objectArray unreachable
    structArray = [Rcd()] // set previous structArray unreachable
    GC()
    sleep(Duration.second * 3) // for non-blocking gc, wait it done
    while (true) {
        if (tmpCheck.Check()) {
            break
        }
    }
    return tmpCheck.Check()
}

main(): Int64 {
    if (TestObjectGC() == true && TestArrayGC() == true) {
        print("success")
    }
    return 0
}
