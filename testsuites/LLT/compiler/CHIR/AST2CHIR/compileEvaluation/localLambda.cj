// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (DEBUG_OPTION)EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (CJNATIVE) ASSERT: scan [readOnly] [compileTimeVal] [internal] @_CN7default8GLOBAL_1E: Int64& = 42
// (CJNATIVE) ASSERT: scan [readOnly] [compileTimeVal] [compilerAdd] @_CN7default4mainHvEL_7LOCAL_1K_E: Int64& = 111



const GLOBAL_1 = 42

main() {
    let local = {
        x: Int64 =>
        const LOCAL_1 = 111;
        x + LOCAL_1
    }(9)
    println(local)
}
