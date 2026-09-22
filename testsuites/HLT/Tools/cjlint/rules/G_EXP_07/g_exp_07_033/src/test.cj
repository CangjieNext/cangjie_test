/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

const MAX_LEN = 99999

func maxIndex(arr: Array<Int64>): Int64 {
    let len = arr.size
    if (MAX_LEN < len) {
        throw Exception("too long")
    } else {
        var i = 0
        var maxI = 0
        while (len > i) {
            if (arr[i] > arr[maxI]) {
                maxI = i
            }
            i++
        }
        return maxI
    }
}

main() {
    println(maxIndex([1, 2, 3]))
}
