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
    public var a2: Int64 = 0
    public var a3: Test = Test()
    public var a4: Int64 = 0
    public var a5: Int64 = 0
    public var a6: Int64 = 0
    public var a7: Int64 = 0
    public var a8: Int64 = 0
    public var a9: Int64 = 0
    public var a10: Int64 = 0
}

struct BigRcd {
    public var a1: Test = Test()
    public var a2: Test = Test()
    public var r0: Rcd = Rcd()
    public var r1: Rcd = Rcd()
    public var r2: Rcd = Rcd()
    public var r3: Rcd = Rcd()
    public var r4: Rcd = Rcd()
    public var r5: Rcd = Rcd()
    public var r6: Rcd = Rcd()
    public var r7: Rcd = Rcd()
    public var r8: Rcd = Rcd()
    public var r9: Rcd = Rcd()
}

class MiddleObj <: TestBase {
    public var a1: Int32 = 3
    public var a2: Test = Test()
    public var a3: Int32 = 5
    public var a4: Test = Test()
    public var r1: BigRcd = BigRcd() // struct r1 is flattened in MiddleObj
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

class BigObj <: TestBase {
    public var a1: Int32 = 3
    public var a2: Test = Test()
    public var a3: Int32 = 5
    public var a4: Test = Test()
    public var r1: BigRcd = BigRcd() // struct r1 is flattened in BigObj
    public var r2: BigRcd = BigRcd()
    public var r3: BigRcd = BigRcd()
    public var r4: BigRcd = BigRcd()
    public var r5: BigRcd = BigRcd()
    public var r6: BigRcd = BigRcd()
    public var r7: BigRcd = BigRcd()
    public var r8: BigRcd = BigRcd()
    public var r9: BigRcd = BigRcd()
    public var r10: BigRcd = BigRcd()
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

func TestObjectGC(): Bool {
    tmpCheck.Reset()
    var s1: BigObj = BigObj()
    var s2: MiddleObj = MiddleObj()
    var r1: BigRcd = BigRcd()

    tmpCheck.RegisterIndex(s1)
    tmpCheck.RegisterIndex(r1.r1.a3)
    tmpCheck.RegisterIndex(s2)

    s1.r1 = BigRcd()
    s2.r1 = BigRcd()

    GC()

    // 3 + 3 + 2 == 8
    if ((Int64(s1.a1) + Int64(s2.a1) + Int64(r1.r1.a1)) != Int64(8)) {
        print("fail: sum is not 8!")
        return false
    }

    s1 = BigObj() // set previous s1 unreachable
    r1 = BigRcd() // set previous r1 unreachable
    s2 = MiddleObj() // set previous s1 unreachable

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
    var bigObjectArray: Array<BigObj> = [BigObj(), BigObj(), BigObj(), BigObj()]
    var mObjectArray: Array<MiddleObj> = [MiddleObj(), MiddleObj(), MiddleObj(), MiddleObj()]
    var bigRecordArray: Array<BigRcd> = [BigRcd(), BigRcd(), BigRcd(), BigRcd()]

    tmpCheck.RegisterIndex(bigObjectArray[0])
    tmpCheck.RegisterIndex(mObjectArray[0])
    tmpCheck.RegisterIndex(bigRecordArray[0].r1.a3)

    bigObjectArray[2] = BigObj()
    mObjectArray[2] = MiddleObj()
    bigRecordArray[2] = BigRcd()

    GC()

    // 3 + 3 + 2 == 8
    if ((Int64(bigObjectArray[2].a1) + Int64(mObjectArray[2].a1) + Int64(bigRecordArray[1].r1.a1)) != Int64(8)) {
        print("fail: sum is not 8!")
        return false
    }

    bigObjectArray = [BigObj(), BigObj()] // set previous bigObjectArray unreachable
    mObjectArray = [MiddleObj(), MiddleObj()] // set previous mObjectArray unreachable
    bigRecordArray = [BigRcd(), BigRcd()] // set previous bigRecordArray unreachable
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
