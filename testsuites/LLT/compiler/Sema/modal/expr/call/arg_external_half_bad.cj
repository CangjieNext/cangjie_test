// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %local %diag_json %f 2>&1 | compare %f

func g(s: String @local!) {}

func f(c: Bool, a: String @local!) {
    g(if (c) {
        a
    } else {
        "x"
    })
}

main() {}

// ASSERT: scan "DiagKind": "sema_external_local_arg",
// ASSERT: scan "Errors": 1,
