// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output -Woff all 2>&1 | compare %f

class C {}
struct A<T> {}

func foo() {
    let b = A<Int @local!> @local! ()
    let c = A<Int @local?> @local? ()
    let d = A<Int @~local> @~local ()
}
main() {}

// ASSERT: scan-3 "DiagKind": "parse_unexpected_modal_type",
// ASSERT: scan "Errors": 3,
