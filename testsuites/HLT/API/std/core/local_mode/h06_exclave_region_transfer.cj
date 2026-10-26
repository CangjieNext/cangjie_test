/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func assertEq<T>(actual: T, expected: T, name: String): Int64 where T <: ToString & Equatable<T> {
    if (actual != expected) {
        println("FAIL: ${name} — expected ${expected}, got ${actual}")
        return 1
    }
    return 0
}

func transferArrayToCallerRegion(seed: Int64): Array<Int64> @local! {
    exclave {
        let result: Array<Int64> @local! = [seed, seed + 1, seed + 2]
        result
    }
}

main(): Int64 {
    var failed = 0

    let transferred: Array<Int64> @local! = transferArrayToCallerRegion(40)

    transferred[2] = 99

    failed += assertEq(transferred.size, 3, "h06_size")
    failed += assertEq(transferred[0], 40, "h06_elem0")
    failed += assertEq(transferred[1], 41, "h06_elem1")
    failed += assertEq(transferred[2], 99, "h06_elem2")

    // SKIPPED: iterator()/next() on @local! — std 库缺 Array @local! iterator() 重载
    // SKIPPED: Option @local! assertEq — 跨 mode 赋值无重载

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
