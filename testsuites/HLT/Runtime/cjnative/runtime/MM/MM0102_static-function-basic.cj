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

class MM_basic <: Tool {
    public var obj: Object = Tool()
    public var str: Array<String> = []

    public static func consume(t: Object): Unit {}
    // simple new and recycle
    public static func test1(): Unit {
        let obj: MM_basic = MM_basic()
        consume(obj)
    }
    // new and return
    public static func test2(): MM_basic {
        let obj: MM_basic = MM_basic()
        return obj
    }
    // new and consume and return
    public static func test3(): Object {
        let obj: MM_basic = MM_basic()
        consume(obj)
        return obj
    }
    // load and consume
    public static func test4(mm: MM_basic): Unit {
        let obj: Object = mm.obj
        consume(obj)
    }
    // load and consume
    public static func test5(mm: MM_basic): Unit {
        consume(mm.obj)
    }
    // load and return
    public static func test6(mm: MM_basic): Object {
        return mm.obj
    }
    // load and consume and return
    // static func test7(mm : MM_basic): Object {
    // }
    // call and consume
    public static func test8(): Unit {
        let obj: MM_basic = test2()
        consume(obj)
    }
    // call and consume and return
    public static func test9(): Object {
        let obj: MM_basic = test2()
        consume(obj)
        return obj
    }
    // call
    public static func test10(): Unit {
        test2()
    }

    public static func mm_testcase_main_wrapper(): Unit {
        let mm: MM_basic = MM_basic()
        mm.obj = Tool()
        mm.str = Array<String>(10, repeat: "")
        test1()
        test2()
        test3()
        test4(mm)
        test5(mm)
        test6(mm)
        test8()
        test9()
        test10()
    }
}

main(): Int64 {
    MM_basic.mm_testcase_main_wrapper()
    MM_basic.mm_testcase_main_wrapper()
    print((1).toString())
    return 0
}
