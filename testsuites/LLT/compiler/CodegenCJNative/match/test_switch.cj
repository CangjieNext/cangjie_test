// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
/// EXEC: %frontendCompiler %enableO2 %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

/// ASSERT: regex switch i64 %\d+, label %default_thunk \[

enum RGBColor {
    | Red | Green | Blue
}

main() {
    let c = RGBColor.Red
    let cs = match (c) {
        case Green => "Green"
        case Blue => "Blue"
        case Red => "red"
    }
    print(cs)
    if (cs == "red") {
        return 0
    }
    return 1
}
