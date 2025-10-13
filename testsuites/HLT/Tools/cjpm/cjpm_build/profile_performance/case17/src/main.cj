/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package case08

import std.random.*

func qsort_kernel(a: Array<Float64>, lo: Int64, hi: Int64): Array<Float64> {
    var i = lo
    var j = hi
    var tmpLo = lo
    while (i < hi) {
        var pivot = a[(tmpLo + hi) / 2]
        while (i <= j) {
            while (a[i] < pivot) {
                i += 1
            }
            while (a[j] > pivot) {
                j -= 1
            }
            if (i <= j) {
                var tmp = a[i]
                a[i] = a[j]
                a[j] = tmp
                i += 1
                j -= 1
            }
        }
        if (tmpLo < hi) {
            qsort_kernel(a, tmpLo, j)
        }
        tmpLo = i
        j = hi
    }
    return a
}

main() {
    var lst = Array<Float64>(500, repeat: 0.0)
    var r = Random(9)
    for (k in 0..lst.size) {
        lst[k] = r.nextFloat64()
    }
    qsort_kernel(lst, 0, lst.size - 1)
    return 0
}
