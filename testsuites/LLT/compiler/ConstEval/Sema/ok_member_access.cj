// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_result` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {
    let b = B()
    const init() {}
}

class B {
    let c = 0
    const init() {}
}

const func f() {
    let a = A()
    a.b.c
}

main() {
    const result = f()
    result
}
