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

class MM_multest <: Tool {
    public static var f:Foo = Foo()
    public var obj: Object = Tool()
    public var b: Array<UInt8> = []

    public static func consume(obj: Object): Unit {
        f.consume(obj)
    }
    public static func consume_return(obj: Object): Object {
        return obj;
    }

    // local variable
    // 1. local varaible is redefined in if/loop by new object
    // 2. local varaible is redefined in if/loop by call
    public static func testFlow1(num: Int64): Object {
        var mm: Object = Tool()
        var i: Int64 = 1
        while (i < num) {
            if ((i % 5) == 0) {
                mm = MM_multest()
            }
            i++
        }
        return mm
    }
    public static func testFlow2(num: Int64): Object {
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
    // simple new and recycle
    public static func test1(): Unit {
        let obj: MM_multest = MM_multest()
        consume(obj)
    }
    // new and return
    public static func test2(): MM_multest {
        let obj: MM_multest = MM_multest()
        return obj
    }
    // new and consume and return
    public static func test3(): Object {
        let obj: MM_multest = MM_multest()
        consume(obj)
        return obj
    }
    // load and consume
    public static func test4(mm: MM_multest): Unit {
        let obj: Object = mm.obj
        consume(obj)
    }
    // load and consume
    public static func test5(mm: MM_multest): Unit {
        consume(mm.obj)
    }
    // load and return
    public static func test6(mm: MM_multest): Object {
        return mm.obj
    }
    // load consume and return
    // static func test7(mm : MM_multest): Object {
    //     let o : Object = mm.b
    //     consume(o)
    //     return o
    // }
    // call and consume
    public static func test8(): Unit {
        let obj: MM_multest = test2()
        consume(obj)
    }
    // call consume and return
    public static func test9(): Object {
        let obj: MM_multest = test2()
        consume(obj)
        return obj
    }
    // call and not consume
    public static func test10(): Unit {
        test2()
    }

    // parameter related
    // 1. parameter is returned
    // 2. parameter is redefined
    // 3. parameter is redefined conditionally
    public static func testParam1(mm: MM_multest): Object {
        consume(mm)
        return mm
    }
    // static func testParam2(mm : MM_multest): Object {
    //     consume(mm)
    //     mm = test2()
    //     return mm
    // }
    // static func testParam3(mm : MM_multest): Object {
    //     consume(mm)
    //     if (mm.b != []) {
    //         mm = test()
    //     }
    //     return mm
    // }

    public static func testSimple(): Unit {
        let mm = MM_multest()
        mm.obj = Tool()
        mm.b = Array<UInt8>(10, repeat: 0)
        test1()
        test2()
        test3()
        test4(mm)
        test5(mm)
        test6(mm)
        // test7(mm)
        test8()
        test9()
        test10()
    }
    public static func testParam(): Unit {
        let mm = MM_multest()
        mm.obj = Tool()
        mm.b = Array<UInt8>(10, repeat: 0)
        testParam1(mm)
        // testParam2(mm)
        // testParam3(mm)
    }
    public static func testFlow(): Unit {
        testFlow1(21)
        testFlow2(30)
    }

    public static func mm_testcase_main_wrapper(): Unit {
        testSimple()
        testParam()
        testFlow()
    }
}

open class Foo {
    public open func consume(obj: Object): Unit {
    }
}

class Bar <: Foo {
    public override func consume(obj: Object): Unit {
    }
}

main(): Int64 {
    MM_multest.mm_testcase_main_wrapper()
    // GC()
    MM_multest.mm_testcase_main_wrapper()
    print((1).toString())
    return 0
}
