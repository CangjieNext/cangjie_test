// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f
// ASSERT: regex-auto distinct !DISubprogram(name: "gv$_a", linkageName: "_CGV7default1aHv"

var a = [1, 2]

main() {
    0
}
