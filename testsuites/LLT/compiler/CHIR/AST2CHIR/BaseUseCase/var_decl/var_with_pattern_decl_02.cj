// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (not Windows) ASSERT: regex-not \[readOnly\] %[0-9]+: Int64\& = Allocate\(Int64\) // loc: "var_with_pattern_decl_02.cj"-7-10, scope: 0
// (not Windows) ASSERT: regex-not %[0-9]+: Unit = Store\(%[0-9]+, %[0-9]+\) // loc: "var_with_pattern_decl_02.cj"-7-10, scope: 0

main() {
    let (a, b): (Int64, Int64) = (1, 2)
    0
}
