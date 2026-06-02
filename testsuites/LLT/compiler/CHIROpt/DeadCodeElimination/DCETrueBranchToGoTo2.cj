// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %disableCodegen -Woff all %f -o %n.%suffix 2>&1 | compare %f

main() {
    match (3) {
        case 1 | 2 | 3 => 1
        case _ => 2
        case 4 => 3
        case _ => 4
    }
}

// ASSERT: scan [DCE] The MultiBranch expression at [11,5] has been deleted
