// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and (DEBUG_OPTION)) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func const_demo_func(a: Int64): Int64{
    a
}

const func const_demo(p: (Int64)-> Int64, v: Int64): Int64{
    p(v)
}

const f = const_demo(const_demo_func, 1)

main() {}