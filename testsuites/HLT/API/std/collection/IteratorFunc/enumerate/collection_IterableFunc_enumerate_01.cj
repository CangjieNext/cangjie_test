/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int64> = [8, 9, 10, 25]
    var arr2 = Array<Float64>()
    var str1 = "dbadahjdga4242424中jhgdhjad"
    var str2 = ""
    var set1 = HashSet<Int32>([8, 9, 10, 25])
    var set2 = HashSet<Int8>()
    var arraylist1 = ArrayList<Int16>([8, 9, 10, 25])
    var arraylist2 = ArrayList<UInt32>()
    var cases = [
        testIterableEnumerate<Int64>(arr1),
        testIterableEnumerate<Float64>(arr2),
        testIterableEnumerate<Byte>(str1),
        testIterableEnumerate<Byte>(str2),
        testIterableEnumerate<Int32>(set1),
        testIterableEnumerate<Int8>(set2),
        testIterableEnumerate<Int16>(arraylist1),
        testIterableEnumerate<UInt32>(arraylist2)
    ]
    for (testcase in cases) {
        if (testcase != 0) {
            return 1
        }
    }
    return 0
}
/*
    The generated index iterator is verified by looping next() to obtain the next element of the iterator.
    By verifying that the index of the generated index iterator is in a one-to-one correspondence with the element of the iterator,
    the generated index iterator is correct.Returns 0 if exact, otherwise returns 1
    params:
    it: Original Iterable<T>
 */
public func testIterableEnumerate<T>(it: Iterable<T>): Int64 where T <: Equatable<T> {
    var arraylistExpect: ArrayList<T> = ArrayList<T>()
    for (i in it) {
        arraylistExpect.add(i)
    }
    var resultIterableWithIndex = enumerate<T>(it)
    for (i in 0..arraylistExpect.size) {
        let (indexNum, ele) = resultIterableWithIndex.next().getOrThrow()
        if (indexNum != i || ele != arraylistExpect[i]) {
            return 1
        }
    }
    return 0
}
