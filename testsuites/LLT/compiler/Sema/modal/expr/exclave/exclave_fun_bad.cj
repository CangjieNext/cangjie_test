// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An `exclave func` already provides an exclave region for its body; a nested `exclave { }` is illegal.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output -Woff all 2>&1 | compare %f

class C {
    exclave init(this @local!) {}
    exclave func nested(): C @local! {
        exclave { C @local!() }
    }
}
main() {}

// ASSERT: scan "DiagKind": "sema_nested_exclave",
// ASSERT: scan "Errors": 1,