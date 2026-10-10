// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a plugin round trip preserves match traversal metadata across pattern and sibling-case control flow.
// (Linux) EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %diag_json %f -o %output %collect_aspects_plugin 2>&1 | compare %f

// ASSERT: scan-3 "DiagKind": "chir_unreachable_pattern"

main() {
    const selector = 1
    match (selector) {
        case 1 => 0
        case value where true => 1
        case 2 => 2
        case _ => 3
    }
}
