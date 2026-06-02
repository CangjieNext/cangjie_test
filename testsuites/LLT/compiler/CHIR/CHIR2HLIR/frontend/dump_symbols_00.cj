// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-symbols %f 2>&1 | compare %f
// ASSERT: scan "identifier": "foo"
// ASSERT: scan "identifier": "main"
// ASSERT: scan "identifier": "a"

func foo(): Int64 {
    0
}

main(): Int64 {
    let a = foo()
    return a
}
