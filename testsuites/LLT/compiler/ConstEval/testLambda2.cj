// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_fff` of 4 expressions to one of 3 expressions
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_xxx` with initializer constant(s)
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation with lambdas.

const fff = { x: Int64 =>
    let one = 1
    2 * x + one
}
const xxx = fff(1)
main() { xxx - 3 }
