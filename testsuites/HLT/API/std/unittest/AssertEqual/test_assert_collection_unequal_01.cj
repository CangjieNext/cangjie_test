/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan Different sizes: 2([1, 2]) != 1([1])
// ASSERT: scan Different sizes: 2(["", ""]) != 1([""])
// ASSERT: scan Different sizes: 2([[1, 2],[1, 2]]) != 3([[1, 2],[1, 2],[]])
// ASSERT: scan Different sizes: 2([[1, 2],[1, 2]][1]) != 3([[1, 2],[1, 2, 3]][1])
// ASSERT: scan Different sizes: 1([[[1]]]) != 2([[[1]],[[]]])
// ASSERT: scan [20]: 0 != 20
// ASSERT: scan [19]: "" != "19"
// ASSERT: scan further 9 different elements are omitted
// ASSERT: scan further 10 different elements are omitted
// ASSERT: scan Different elements (left - arr1[0][1], right - arr2[0][1]):
// ASSERT: scan [1]: 2 != 0

@Test
public class Test_AssertEqual_Array {
    @TestCase
    func test_array_size() {
        @Expect([1, 2], [1])
        @Expect(["", ""], [""])
        @Expect([[1, 2], [1, 2]], [[1, 2], [1, 2], []])
        @Expect([[1, 2], [1, 2]], [[1, 2], [1, 2, 3]])
        @Expect([[[1]]], [[[1]], [[]]])
    }

    @TestCase
    func test_assert_array_d1_20_differents() {
        @Expect(Array<Int64>(30, repeat: 0), Array<Int64>(30, {i => i}))
        @Expect(Array<String>(30, repeat: ""), Array<String>(30, {i => i.toString()}))
    }

    @TestCase
    func test_nested_array_element() {
        let arr1 = [
            [
                [1, 2, 3],
                [1, 2, 3]
            ]
        ]
        let arr2 = [
            [
                [1, 2, 3],
                [1, 0, 3]
            ]
        ]
        @Expect(arr1, arr2)
    }
}
