// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
/// EXEC: %frontendCompiler %enableO2 %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

/// ASSERT: regex-begin default_thunk:
/// ASSERT: regex-next br label %switch_end
/// ASSERT: regex-after case_0_thunk:
/// ASSERT: regex-next br label %switch_end
/// ASSERT: regex-after case_1_thunk:
/// ASSERT: regex-next br label %switch_end
/// ASSERT: regex-after case_2_thunk:
/// ASSERT: regex-next br label %switch_end

enum RGBColor {
    | Red | Green | Blue
}

main() {
    let c = RGBColor.Red
    let cs = match (c) {
        case Green => ()
        case Blue => ()
        case Red => ()
    }
    print(cs == ())
    return 0
}
