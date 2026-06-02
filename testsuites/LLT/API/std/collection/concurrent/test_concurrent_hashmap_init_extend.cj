/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

/**
 * Test description: Tests the correctness of the 'init' functions:
 * - 'init(capacity: Int64, concurrencyLevel!: Int64 = DEFAULT_CONCUR_LEVEL)';
 * - 'init(concurrencyLevel!: Int64 = DEFAULT_CONCUR_LEVEL)';
 * - 'init(elements: Collection<(K, V)>, concurrencyLevel!: Int64 = DEFAULT_CONCUR_LEVEL)';
 * - 'init(size: Int64, initElement: (Int64) -> (K, V), concurrencyLevel!: Int64 = DEFAULT_CONCUR_LEVEL)'.
 */

internal import std.collection.concurrent.*

/**
 * Returns:
 * 0: init test pass
 * 1: init test fail
 */
public func ConcurrentHashMapInitTest(): Int64 {
    const N: Int64 = 300000
    let elements = Array<(Int64, Int64)>(N, {i => (i, i + 5)})

    let cmap1 = ConcurrentHashMap<Int64, Int64>()
    let cmap2 = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: 256)
    let cmap3 = ConcurrentHashMap<Int64, Int64>(1024, concurrencyLevel: 32)
    let cmap4 = ConcurrentHashMap<Int64, Int64>(elements, concurrencyLevel: 16)

    let res = Array<Int64>(N, repeat: -1)
    let resArr = Array<Int64>(N, {i => i + 5})
    for ((k, v) in cmap4) {
        res[k] = v
    }

    if (res == resArr) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return ConcurrentHashMapInitTest()
}
