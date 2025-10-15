// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %trimpath_opt %pwd %enableCompileDebug %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex !DIFile\(filename: "trim_path.cj", directory: ""\)

main() {
    var a = 5000
    return 0
}
