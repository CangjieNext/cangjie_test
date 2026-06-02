/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// ASSERT: scan function 'nextUInt8s' is deprecated. Use `public func nextBytes(arr: Array<Byte>): Unit` instead.
import std.random.*

main() {
    var seed: UInt64 = 15
    var r = Random(seed)
    var arraylist: Array<UInt8> = [9, 3, 4, 5, 6, 7, 7]
    var empty_array = Array<UInt8>()
    var arraysize = arraylist.size
    var emptysize = empty_array.size

    for (i in 0..88) {
        var arraylist2 = r.nextUInt8s(arraylist)
        for (j in arraylist2) {
            if (j is UInt8) {
                if (arraylist2.size != arraysize) {
                    print("array is wrong\n")
                    return 1
                }
            } else {
                print("array is not utf-8\n")
                return 3
            }
        }
    }
    for (i in 0..300) {
        var empty_array2 = r.nextUInt8s(empty_array)
        if (empty_array2.size != emptysize) {
            return 2
        }
    }

    return 0
}
