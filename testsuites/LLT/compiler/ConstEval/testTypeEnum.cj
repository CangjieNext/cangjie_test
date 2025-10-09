// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 function `gv$_ones` not evaluated successfully.
// (not CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_ones` of 4 expressions to one of 11 expressions.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with enum type.

enum Stream<T> {
    | Nil
    | Cons(T, Stream<T>)
    | Thunk(() -> Stream<T>)
}

const func repeat<T>(x: T): Stream<T> {
    Cons(x, Thunk({ => repeat(x) }))
}

main() {
    const ones = repeat(1)
}
