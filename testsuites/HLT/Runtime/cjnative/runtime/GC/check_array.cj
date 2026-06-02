/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
package A

import std.collection.*
import std.sync.*

public class CheckArray {
    let checkArray = ArrayList<Int64>()
    var checkIndex: Int64 = 0
    let mtx: ReentrantMutex = ReentrantMutex()
    public func RegisterIndex(testObj: TestBase): Int64 {
        mtx.lock()
        checkArray.add(1)
        testObj.index = checkIndex
        checkIndex++
        mtx.unlock()
        return testObj.index;
    }

    public func SetIndex(index: Int64):Unit {
        if (index == -1) {
            return
        }
        checkArray[index] = 2
    }

    public func CheckItem(index: Int64): Bool {
        if (checkArray[index] == 1) {
            return false;
        }
        return true;
    }

    public func Check(): Bool {
        let failIndexes = ArrayList<Int64>()
        var i: Int64 = 0
        while (i < checkIndex) {
            if (checkArray[i] == 1) {
                failIndexes.add(i)
            }
            i++
        }

        if (failIndexes.size > 0) {
            i = 0
            print("fail: obj indexes: ")
            while (i < failIndexes.size) {
                print(failIndexes[i].toString() + " ")
                i++
            }
            print("are not freed after GC!\n")
            return false
        }
        return true
    }

    public func Reset():Unit {
        checkArray.clear()
        checkIndex = 0
    }
}

public open class TestBase {
    public var index: Int64 = -1
}
