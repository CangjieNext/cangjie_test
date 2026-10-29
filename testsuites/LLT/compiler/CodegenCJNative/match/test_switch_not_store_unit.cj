// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %frontendCompiler %enableO2 %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-begin switch i32 %\w+, label %bb\d+ \[
// ASSERT: regex-next i32 2, label %bb\d+
// ASSERT: regex-next i32 1, label %bb\d+
// ASSERT: regex-not store %Unit\.Type

enum RGBColor {
    | Red | Green | Blue
}

// A mutable global keeps the selector unknown at compile time; a literal enum
// constructor would be folded before codegen and no switch would be emitted.
var input = RGBColor.Red

func act(tag: String): Unit {
    print(tag)
}

main() {
    let c = input
    let cs = match (c) {
        case Green => act("Green")
        case Blue => act("Blue")
        case Red => act("Red")
    }
    print(cs == ())
    return 0
}
