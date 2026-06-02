// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %disableCodegen -Woff all %f -o %n.%suffix 2>&1 | compare %f

main() {
    let c = r'a'
    let t = match (c) {
        case r'a' | r'b' | r'c' => match (c) {
            case r'a' => return 0
            case _ => return 2
        }
        case r'A' => return 2
        case r'C' => return 2
        case _ => return 2
    }
    return t
}

// ASSERT: scan [DCE] The MultiBranch expression at [12,13] has been deleted
// ASSERT: scan [DCE] The MultiBranch expression at [13,36] has been deleted
