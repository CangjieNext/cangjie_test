// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at testVArray.cj:17:1 - testVArray.cj:17:44 evaluated initializer function `gv$_global`
// ASSERT: scan debug: consteval at testVArray.cj:19:1 - testVArray.cj:19:31 replaced initializer function `gv$_value` with initializer constant(s).
// ASSERT: scan debug: consteval at testVArray.cj:25:1 - testVArray.cj:25:67 evaluated initializer function `gv$_array`
// ASSERT: scan debug: consteval at testVArray.cj:27:1 - testVArray.cj:27:71 evaluated initializer function `gv$_nested`
// ASSERT: scan debug: consteval at testVArray.cj:29:1 - testVArray.cj:29:33 replaced initializer function `gv$_doubleIndex` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const global: VArray<Int64, $3> = [1, 2, 3]

const value: Int64 = global[1]

const func varrayIdentity(x : VArray<Int64, $5>) : VArray<Int64, $5> {
    return x
}

const array: VArray<Int64, $5> = varrayIdentity([5, 7, 9, 11, 13])

const nested: VArray<VArray<Int64, $2>, $3> = [[1, 0], [2, 4], [3, 6]]

const doubleIndex = nested[2][1]

main() {
    global[0] + value + array[2] - 12
}
