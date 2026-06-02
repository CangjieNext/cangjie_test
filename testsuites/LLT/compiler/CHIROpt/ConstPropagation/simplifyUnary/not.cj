// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %enableConstPropagation %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan [ConstPropagation] The result of the trivial Not at [15,17] has been optimised
// ASSERT: scan [ConstPropagation] The result of the trivial Not at [15,13] has been optimised

var b = true

func foo() {
    var x = !(!(!(!b)))
}

main() {
    0
}
