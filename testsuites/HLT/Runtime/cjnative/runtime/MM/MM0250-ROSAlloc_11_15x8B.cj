/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 8

class MyArray_8 {
    public var a: Array<UInt8>
    public var size: Int64
    public init(n: Int64) {
        size = n
        a = Array<UInt8>(size, repeat: 0)
    }
}

class MyArray {
    public var a: Array<MyArray_8> = []
    public var size: Int64 = 0
    public init(n: Int64) {
        size = n
        a = Array<MyArray_8>(size, repeat: MyArray_8(0))
    }

    public func add(e: MyArray_8): Unit {
        var i = size
        size++
        let b = Array<MyArray_8>(size, repeat: MyArray_8(0))
        b[i] = e
        i--
        while (i >= 0) {
            b[i] = a[i]
            i--
        }
        a = b
    }

    public func clear(): Unit {
        size = 0
        a = []
    }
}

class AllocTest {
    public static let PAGE_SIZE: Int64 = 4 * 1024
    public static let OBJ_HEADSIZE: Int64 = 8
    public static let MAX_11_8B: Int64 = 11 * 8
    public static let MAX_12_8B: Int64 = 12 * 8
    public static let MAX_13_8B: Int64 = 13 * 8
    public static let MAX_14_8B: Int64 = 14 * 8
    public static let MAX_15_8B: Int64 = 15 * 8
    public let store: MyArray = MyArray(0)
    public func test(slot_type: Int64): Int64 {
        var temp: MyArray_8
        var i: Int64
        if (slot_type == 24) {
            i = 1
        } else if (slot_type == 1024) {
            i = 64 * 8 + 1 + OBJ_HEADSIZE
        } else {
            i = slot_type - 2 * 8 + 1
        }
        while (i <= slot_type - OBJ_HEADSIZE) {
            var j: Int64 = 0
            while (j < (PAGE_SIZE * 2 / (i + OBJ_HEADSIZE) + 10)) {
                temp = MyArray_8(8)
                store.add(temp)
                j++
            }
            i++
        }
        let check_size = store.size
        store.clear()
        return check_size
    }
}

main(): Int64 {
    let t = AllocTest()
    let countSize11 = t.test(AllocTest.MAX_11_8B);
    let countSize12 = t.test(AllocTest.MAX_12_8B);
    let countSize13 = t.test(AllocTest.MAX_13_8B);
    let countSize14 = t.test(AllocTest.MAX_14_8B);
    let countSize15 = t.test(AllocTest.MAX_15_8B);

    print((AllocTest.OBJ_HEADSIZE).toString())
    return 0
}
