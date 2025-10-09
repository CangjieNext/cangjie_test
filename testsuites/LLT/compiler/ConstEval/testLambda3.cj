// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION and CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_add_two`
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_two_plus_two` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation with lambdas inside a try block.

const add_two: (Int64) -> Int64 = {x: Int64 => x + 2}

const func tryAddTwo(x: Int64): Int64 {
    try {
        add_two(x)
    } catch(_) {
        0
    }
}

const two_plus_two = tryAddTwo(2)

main() {}
