// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %debugCHIROpt %cmp_opt %f -o %output | compare %f
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_global`
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_value` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_array`
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_nested`
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_doubleIndex` with initializer constant(s).
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
