// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %disableCodegen -Woff all %f -o %n.%suffix 2>&1 | compare %f

main(): Int64 {
    if (true) {
        if (false) {
            0
        } else if (true) {
            1
        } else if (false) {
            2
        } else {
            3
        }
    } else {
        -1
    }
    return 0
}

// ASSERT: scan [DCE] The Branch expression at [11,5] has been deleted
// ASSERT: scan [DCE] The Branch expression at [12,9] has been deleted
// ASSERT: scan [DCE] The Branch expression at [14,16] has been deleted
