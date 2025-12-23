// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// `exclave func` body is semantically the same as wrapping the whole body in `exclave { ... }`:
// returns of internal @local! go through the implicit exclave region; no inner `exclave` needed.

// EXEC: %compiler %cmp_opt %f -o %output -Woff all
// RUN-EXEC: %run %run_opt %output %run_args

class C {
    init() {}
    exclave init(this @local!) {}

    exclave func foo() {
        C @local!()
    }
    static exclave unsafe func bar() {
        C @local!()
    }
}
exclave func foo(): C @local! {
    C()
}

main() {}
