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

class Object1 {
    public var array1: Array<Int32> = [3, 5, 7, 9]
    public var array2: Array<Int64> = [22, 33]
}

class Object2 {
    public var objArray: Array<Object1> = [Object1(), Object1()]
    public func CheckAlive(): Bool {
        if ((objArray[0].array2[0] + objArray[1].array2[1]) != 55) { // 22 + 33 = 55
            print("fail: objArray[0].array2[] & objArray[1].array2[] is freed!")
            return false;
        }
        return true;
    }
}

func Func1() {
    var obj1: Object1 = Object1()
    GC()
    // obj1 should not be reclaimed by GC
    if ((obj1.array1[0] + obj1.array1[2]) != 10) { // 3 + 7 = 10
        print("fail: obj1.array1 is freed!")
    }
}

// Objective: stack roots should not be reclaimed by GC
main(): Int64 {
    var obj: Object2 = Object2()
    Func1()
    if (obj.CheckAlive()) {
        print("success")
    }
    return 0
}
