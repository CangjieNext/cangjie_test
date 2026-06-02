// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-symbols %f 2>&1 | compare %f
// ASSERT: scan "astKind": "enum_pattern",
// ASSERT: scan "name": "Some",
// ASSERT: scan "begin": {
// ASSERT: scan   "line": 31,
// ASSERT: scan   "column": 14
// ASSERT: scan },
// ASSERT: scan "end": {
// ASSERT: scan   "line": 31,
// ASSERT: scan   "column": 23
// ASSERT: scan }
// ASSERT: scan "astKind": "enum_pattern",
// ASSERT: scan "name": "Some",
// ASSERT: scan "begin": {
// ASSERT: scan   "line": 31,
// ASSERT: scan   "column": 27
// ASSERT: scan },
// ASSERT: scan "end": {
// ASSERT: scan   "line": 31,
// ASSERT: scan   "column": 37
// ASSERT: scan }

main() {
    match (Some(true)) {
        case Some(true) | Some(false) => 0
        case _ => 1
    }
}
