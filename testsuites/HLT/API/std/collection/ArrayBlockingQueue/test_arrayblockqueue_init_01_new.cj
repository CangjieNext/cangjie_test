/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.collection.concurrent.*
import std.sync.*
import std.math.*

var sum = 0

@Test
class Test_arrayblockqueue {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_init_01(): Unit {
        var arrayqueue = ArrayBlockingQueue<Int64>(1)
        @Expect(arrayqueue.size, 0)
        @Expect(arrayqueue.capacity, 1)
        var arrayqueue1 = ArrayBlockingQueue<Int64>(10000)
        @Expect(arrayqueue1.size, 0)
        @Expect(arrayqueue1.capacity, 10000)
        var arrayqueue2 = ArrayBlockingQueue<String>(1)
        @Expect(arrayqueue2.size, 0)
        @Expect(arrayqueue2.capacity, 1)
        var arrayqueue3 = ArrayBlockingQueue<String>(10000)
        @Expect(arrayqueue3.size, 0)
        @Expect(arrayqueue3.capacity, 10000)
    }

    @TestCase
    func test_error_init_02(): Unit {
        try {
            ArrayBlockingQueue<Int64>(0)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of ArrayBlockingQueue: 0"))
            sum += 1
        }
        @Expect(sum, 1)

        try {
            ArrayBlockingQueue<String>(0)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of ArrayBlockingQueue: 0"))
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_error_init_03(): Unit {
        try {
            ArrayBlockingQueue<Int64>(-1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of ArrayBlockingQueue: -1"))
            sum += 1
        }
        @Expect(sum, 1)

        try {
            ArrayBlockingQueue<String>(-9223372036854775808)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid size of ArrayBlockingQueue: -9223372036854775808"))
            sum += 1
        }
        @Expect(sum, 2)
    }

    // @TestCase
    // func test_element_init_04():Unit{
    //     var arrayqueue = ArrayBlockingQueue<Int64>(1, Array<Int64>())
    //     @Expect(arrayqueue.size, 0)
    //     @Expect(arrayqueue.capacity, 1)
    //     var arrayqueue1 = ArrayBlockingQueue<Int64>(10, Array<Int64>(10, {i => i + 10}))
    //     @Expect(arrayqueue1.size, 10)
    //     @Expect(arrayqueue1.capacity, 10)

    //     var arrayqueue2 = ArrayBlockingQueue<String>(1, Array<String>())
    //     @Expect(arrayqueue2.size, 0)
    //     @Expect(arrayqueue2.capacity, 1)

    //     var arrayqueue3 = ArrayBlockingQueue<String>(10, Array<String>(10, {i => "${i + 10}"}))
    //     @Expect(arrayqueue3.size, 10)
    //     @Expect(arrayqueue3.capacity, 10)
    // }

    // @TestCase
    // func test_error_element_init_05():Unit{
    //     try {
    //         ArrayBlockingQueue<Int64>(0,Array<Int64>())
    //     }catch(e:IllegalArgumentException) {
    //         @Expect(e.message.contains("Invalid size of ArrayBlockingQueue: 0"))
    //         sum += 1
    //     }
    //     @Expect(sum, 1)

    //     try {
    //         ArrayBlockingQueue<String>(-1,["hhh"])
    //     }catch(e:IllegalArgumentException){
    //         @Expect(e.message.contains("Size of ArrayBlockingQueue should be equal or greater than 1"))
    //         sum += 1
    //     }
    //     @Expect(sum, 2)
    // }

    // @TestCase
    // func test_error_element_init_06():Unit{
    //     try {
    //         ArrayBlockingQueue<Int64>(9,Array<Int64>(10, {i => i + 10}))
    //     }catch(e:IllegalArgumentException) {
    //         @Expect(e.message.contains("Size of ArrayBlockingQueue should be equal or greater than 10"))
    //         sum += 1
    //     }
    //     @Expect(sum, 1)

    //     try {
    //         ArrayBlockingQueue<String>(1,  Array<String>(10, {i => "${i + 10}"}))
    //     }catch(e:IllegalArgumentException){
    //         @Expect(e.message.contains("Size of ArrayBlockingQueue should be equal or greater than 10"))
    //         sum += 1
    //     }
    //     @Expect(sum, 2)
    // }
}
