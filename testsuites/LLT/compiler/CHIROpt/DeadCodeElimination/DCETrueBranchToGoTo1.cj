// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %disableCodegen -Woff all %f -o %n.%suffix 2>&1 | compare %f

main() {
    match (34) {
        case 1 => println("red")
        case 2 => println("blue")
        case _ => println("green")
    }
}

// ASSERT: scan [DCE] The MultiBranch expression at [11,5] has been deleted
