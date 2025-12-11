/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-not _CNat9Exception6<init>Hv

internal import std.time.*
internal import std.convert.*
internal import std.sync.*

let g_cnt = AtomicInt64(0)

func partition(list: Array<Int64>, low: Int64, high: Int64): Int64 {
    var pivot = list[low]
    var low = low
    var high = high

    while (low < high) {
        while (low < high && pivot <= list[high]) {
            high -= 1
        }
        list[low] = list[high]

        while (low < high && pivot >= list[low]) {
            low++
        }
        list[high] = list[low]
    }

    list[low] = pivot
    return low
}

func quickSort(list: Array<Int64>, low: Int64, high: Int64): Unit {
    var pivot = 0
    if (low < high) {
        pivot = partition(list, low, high)

        quickSort(list, low, pivot - 1)
        quickSort(list, pivot + 1, high)
    }
}

func bubblesort(list: Array<Int64>, length: Int64): Unit {
    var temp: Int64
    for (i in 0..length) {
        for (j in 0..length - 1 - i) {
            if (list[j] > list[j + 1]) {
                temp = list[j]
                list[j] = list[j + 1]
                list[j + 1] = temp
            }
        }
    }
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64
    let test_arr = Array<Int64>(100, repeat: 0)

    startTime = DateTime.now()
    bubblesort(test_arr, 100)
    endTime = DateTime.now()
    let spend_time = (endTime - startTime).toNanoseconds()
    println("single bubble time: ${spend_time} ns")

    startTime = DateTime.now()
    for (i in 0..1000000) {
        spawn {
            g_cnt.fetchAdd(1)
        }
    }
    endTime = DateTime.now()

    let cnt = g_cnt.load()
    println("cnt = ${cnt}")

    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(1000000)
    println("Segment finished in " + perTime.format(".2") + " ns/op")

    return 0
}
