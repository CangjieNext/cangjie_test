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
class Test_iterator_intersperse_01 {
    @TestCase
    func test_iterator_intersperse_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        @Expect(collectStringFunc(emptyArr1.iterator().intersperse(10)), "")
        @Expect(collectStringFunc(normalArr1.iterator().intersperse(100)), "0,100,2,100,4,100,6,100,8,100,10,100,12,100,14,100,16,100,18")
        @Expect(collectStringFunc(normalArr1.iterator().intersperse(-1000)), "0,-1000,2,-1000,4,-1000,6,-1000,8,-1000,10,-1000,12,-1000,14,-1000,16,-1000,18")
    }

    @TestCase
    func test_iterator_intersperse_02(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
        @Expect(collectArray(emptyArr1.iterator().intersperse("-1")), [])
        @Expect(collectArray(normalArr1.iterator().intersperse("")), ["2", "", "3", "", "4", "", "5", "", "6", "", "7", "", "8", "", "9", "", "10"])
        @Expect(collectArray(normalArr1.iterator().intersperse("仓颉")), ["2", "仓颉", "3", "仓颉", "4", "仓颉", "5", "仓颉", "6", "仓颉", "7", "仓颉", "8", "仓颉", "9", "仓颉", "10"])
        @Expect(collectArray(normalArr1.iterator().intersperse("\0")), ["2", "\0", "3", "\0", "4", "\0", "5", "\0", "6", "\0", "7", "\0", "8", "\0", "9", "\0", "10"])
    }

    @TestCase
    func test_iterator_intersperse_03(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = [Float64(1.11111), Float64(1.11112), Float64(1.11113)]
        @Expect(collectArray(emptyArr1.iterator().intersperse(1.1)), [])
        @Expect(collectArray(normalArr1.iterator().intersperse(-1.1)),  [Float64(1.11111),-1.1,Float64(1.11112),-1.1,Float64(1.11113)])
        @Expect(collectArray(normalArr1.iterator().intersperse(0.0)), [Float64(1.11111),0.0,Float64(1.11112),0.0,Float64(1.11113)])
    }

    @TestCase
    func test_iterator_intersperse_04(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = [r'♬', r'✲', r'✿', r'❈', r'❆']
        @Expect(collectArray(emptyArr1.iterator().intersperse(r'1')), [])
        @Expect(collectArray(normalArr1.iterator().intersperse(r'仓')),  [r'♬', r'仓',r'✲',r'仓',r'✿',r'仓',r'❈',r'仓',r'❆'])
        @Expect(collectArray(normalArr1.iterator().intersperse(r'✿')), [r'♬', r'✿',r'✲',r'✿',r'✿',r'✿',r'❈',r'✿',r'❆'])
    }
}
