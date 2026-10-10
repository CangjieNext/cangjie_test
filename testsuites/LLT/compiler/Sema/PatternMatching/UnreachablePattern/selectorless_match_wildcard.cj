// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.

// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A selectorless wildcard is an unconditional true condition and covers every following sibling.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f -Woff=unused-main 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "sema_unreachable_pattern"

main() {
    let result = match {
        case _ => 0
        case true => 1
        case false => 2
    }
    println(result)
}
