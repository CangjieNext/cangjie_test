// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %dumpCHIRDebug %disableCodegen  -Woff all %f -o %n.%suffix 2>&1 | compare %f

main() {
    var x: Int32 = 1
    var y = x + x
    var z: Float32 = 2.3
    (z + z) > 0.1
    0
}

// ASSERT: scan [DCE] The Constant expression at [12,13] has been deleted
// ASSERT: scan [DCE] The Constant expression at [12,17] has been deleted
// ASSERT: scan [DCE] The Constant expression at [14,6] has been deleted
// ASSERT: scan [DCE] The Constant expression at [14,10] has been deleted
// ASSERT: scan [DCE] The Constant expression at [14,6] has been deleted
// ASSERT: scan [DCE] The Constant expression at [14,15] has been deleted
// ASSERT: scan [DCE] The Constant expression at [14,5] has been deleted
