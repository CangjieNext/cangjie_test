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
// ASSERT:scan 1

open class Tool {
    public let tt: UInt8 = 0
}

class MM_flow <: Tool {
    public var obj: Object = Tool()
    public var b: Array<UInt8> = []

    public func testFlow1(num: Int64): Object {
        var mm: Object = Tool()
        var i: Int64 = 1
        while (i < num) {
            if ((i % 5) == 0) {
                mm = MM_flow()
            }
            i++
        }
        return mm
    }
    public func testFlow2(num: Int64): Object {
        var mm: Object = Tool()
        var i: Int64 = 1
        while (i < num) {
            if ((i % 5) == 0) {
                mm = test2()
            }
            i++
        }
        return mm
    }
    public func testFlow3(num: Int64): Unit {
        var mm: Object = Tool()
        var i: Int64 = 1
        while (i < num) {
            if ((i % 5) == 0) {
                mm = test2()
            }
            i++
        }
    }

    public func test2(): MM_flow {
        let obj: MM_flow = MM_flow()
        return obj
    }

    public func mm_testcase_main_wrapper(): Unit {
        testFlow1(21);
        testFlow2(30);
        testFlow3(56);
    }
}

main(): Int64 {
    var o = MM_flow()
    o.mm_testcase_main_wrapper()
    // GC()
    o = MM_flow()
    o.mm_testcase_main_wrapper()
    print((1).toString())
    return 0
}
