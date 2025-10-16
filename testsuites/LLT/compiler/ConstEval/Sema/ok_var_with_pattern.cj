// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `_CGV7default13tuple_patternHv:a:b:c:d` with initializer constant(s).
// (not CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_tuple_pattern:a:b:c:d` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_result` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum E { A(Int64) }

const (A(a), (b, (c, d))) = (A(1), (2, (3, 4)))

const func f() {
    a == 1 && b == 2 && c == 3 && d == 4
}

main() {
    const result = f()
    if (result) {
        0
    } else {
        1
    }
}
