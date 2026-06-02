// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC-6: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_global` of 6 expressions to one of 5 expressions.
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_result` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const global: VArray<Int64, $3> = [1, 2, 3]

const func f(arr: VArray<Int64, $3>) {
    arr[0] + arr[1] + arr[2]
}

main() {
    const result = f(global)
    result
}