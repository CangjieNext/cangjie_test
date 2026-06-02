// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %disableCodegen -Woff all %f -o %n.%suffix 2>&1 | compare %f

main() {
    match (true) {
        case true | false | true => 1
        case false => 2
        case true => 3
        case _ => 4
    }
}

// ASSERT: scan [DCE] The MultiBranch expression at [0,0] has been deleted
