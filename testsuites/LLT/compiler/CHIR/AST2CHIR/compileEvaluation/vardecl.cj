// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (DEBUG_OPTION)EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// ASSERT: regex \[compileTimeVal\].*GLOBAL_2
// ASSERT: regex \[compileTimeVal\].*GLOBAL_1
// ASSERT: regex \[compileTimeVal\].*Func.*GLOBAL_2
// (CJNATIVE) ASSERT: regex \[compileTimeVal\].*Int64.*_CN7default8GLOBAL_2L_E


const GLOBAL_1 = 42
const GLOBAL_2 = {
    x: Int64 =>
    const LOCAL_1 = 111;
    x + LOCAL_1
}(9)

main() {
    println("GLOBAL_1: " + GLOBAL_1.toString())
    println("GLOBAL_2: " + GLOBAL_2.toString())
    0
}
