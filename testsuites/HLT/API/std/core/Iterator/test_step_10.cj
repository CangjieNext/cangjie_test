/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.math.*

var collectStringFunc = collectString<Int64>(delimiter: ",")

@Test
class Test_step_10 {
    /*
     * Test description:
     *     test the func of step set the Int
     * Test API:
     *     public func step(count: Int64): Iterator<T> { ... }
     */
    @TestCase
    func test_step_01(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, {val => val * 2})
        @Expect(collectArray<Int64>(normalArr1.iterator().step(3)), [0,6])
        @Expect(collectArray<Int64>(normalArr1.iterator().step(Int64.Max)), [0])
    }

    /*
     * Test description:
     *     test the func of step set the String
     * Test API:
     *     public func step(count: Int64): Iterator<T> { ... }
     */
    @TestCase
    func test_step_02(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        let normalArr1: Array<String> = Array<String>(5, repeat: "仓颉")
        let normalArr2: Array<String> = Array<String>(5, repeat: "")
        let normalArr3: Array<String> = Array<String>(5, repeat: "\0")
        let normalArr4: Array<String> = Array<String>(5, repeat: str_long)
        let normalArr5: Array<String> = Array<String>(5, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        @Expect(collectArray<String>(normalArr1.iterator().step(3)), ["仓颉","仓颉"])
        @Expect(collectArray<String>(normalArr2.iterator().step(4)), ["",""])
        @Expect(collectArray<String>(normalArr3.iterator().step(2)), ["\0", "\0", "\0"])
        @Expect(collectArray<String>(normalArr4.iterator().step(1)), Array<String>(5, repeat: str_long) )
        @Expect(collectArray<String>(normalArr5.iterator().step(4)), ["♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈","♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"])
        @Expect(collectArray<String>(normalArr5.iterator().step(10)), ["♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"])
        @Expect(collectArray<String>(normalArr1.iterator().step(Int64.Max)), ["仓颉"])
    }

    /*
     * Test description:
     *     test the func of step set the Float64
     * Test API:
     *     public func step(count: Int64): Iterator<T> { ... }
     */
    @TestCase
    func test_step_03(): Unit {
        let normalArr1: Array<Float64> = Array<Float64>(5, repeat: Float64(1.111111))
        @Expect(collectArray<Float64>(normalArr1.iterator().step(3)), [Float64(1.111111),Float64(1.111111)])
        @Expect(collectArray<Float64>(normalArr1.iterator().step(Int64.Max)), [Float64(1.111111)])
    }

    /*
     * Test description:
     *     test the func of step set the Rune
     * Test API:
     *     public func step(count: Int64): Iterator<T> { ... }
     */
    @TestCase
    func test_step_04(): Unit {
        let normalArr1: Array<Rune> = Array<Rune>(5, repeat: r'♬')
        @Expect(collectArray<Rune>(normalArr1.iterator().step(3)), [r'♬',r'♬'])
        @Expect(collectArray<Rune>(normalArr1.iterator().step(Int64.Max)), [r'♬'])
    }

    /*
     * Test description:
     *     test the func of step of exception
     * Test API:
     *     public func step(count: Int64): Iterator<T> { ... }
     */
    @TestCase
    func test_step_05(): Unit {
        let normalArr1: Array<Rune> = Array<Rune>(5, repeat: r'♬')
        let normalArr2: Array<Int64> = Array<Int64>(5, {val => val * 2})
        let normalArr3: Array<String> = Array<String>(5, repeat: "仓颉")
        let normalArr4: Array<Float64> = Array<Float64>(5, repeat: Float64(1.111111))
        try {
            collectArray<Rune>(normalArr1.iterator().step(Int64.Min))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<Rune>(normalArr1.iterator().step(0))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<Int64>(normalArr2.iterator().step(Int64.Min))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<Int64>(normalArr2.iterator().step(0))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<String>(normalArr3.iterator().step(Int64.Min))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<String>(normalArr3.iterator().step(0))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<Float64>(normalArr4.iterator().step(Int64.Min))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }

        try {
            collectArray<Float64>(normalArr4.iterator().step(0))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Step count must be greater than 0!")
        }
    }
}
