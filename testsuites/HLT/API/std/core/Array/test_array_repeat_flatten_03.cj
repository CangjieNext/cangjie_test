/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
class Test_array_repeat_flatten_03 {
    @TestCase
    func test_repeat_flatten_01(): Unit {
        func transform(x: Int64): String {
            x.toString()
        }
        let arr = Array(10, {i: Int64 => i + 1})
        let res = arr.map<String>(transform)
        let res1 = res.removePrefix(["1", "2"])
        let res2 = res1.removeSuffix(["1", "2"])
        @Expect(res2, ["3","4","5","6","7","8","9","10"])
        @Expect(res2.repeat(1),["3","4","5","6","7","8","9","10"])
        @Expect(res2.repeat(2),["3","4","5","6","7","8","9","10","3","4","5","6","7","8","9","10"])

        let e = @AssertThrows[IllegalArgumentException](res2.repeat(0))
        @Expect(e.message.contains("N is less than or equal to 0."))
    }

    @TestCase
    func test_repeat_flatten_02(): Unit {
        func predicate(x: Int64): Bool {
            x % 2 == 0
        }
        let arr = Array(10, {i: Int64 => i + 1})
        let res1 = arr.trimStart(predicate)
        @Expect(res1, arr)
        let res2 = arr.trimEnd(predicate)
        @Expect(res2, [1,2,3,4,5,6,7,8,9])
    }

    @TestCase
    func test_repeat_flatten_05(): Unit {
        let arr: Array<Array<Int64>> = [[1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11, 12]]
        let res1 = arr.removePrefix([1])
        @Expect(res1, [[1,2],[3,4,5],[6,7,8],[9,10,11,12]])
        let res2 = arr.removePrefix([1, 2])
        @Expect(res2, [[3,4,5],[6,7,8],[9,10,11,12]])
        let res3 = res2.removeSuffix([12])
        @Expect(res3, [[3,4,5],[6,7,8],[9,10,11,12]])
        @Expect(res3.flatten(), [3,4,5,6,7,8,9,10,11,12])
    }

    @TestCase
    func test_repeat_flatten_06(): Unit {
        let arr: Array<Array<Array<Int64>>> = [[[1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11, 12]]]
        @Expect(arr.flatten(), [[1,2],[3,4,5],[6,7,8],[9,10,11,12]])
        let res1 = arr.removePrefix([[21, 22]])
        @Expect(res1, [[[1,2],[3,4,5],[6,7,8],[9,10,11,12]]])
        let res2 = arr.removePrefix([[[1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11, 12]]])
        @Expect(res2, [])
        let res3 = arr.removeSuffix([[[1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11, 12]]])
        @Expect(res3, [])
    }
}
