// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (DEBUG_OPTION)EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// ASSERT: regex \[compileTimeVal\].*Func.*dec
// ASSERT: regex \[compileTimeVal\].*h_LOCAL_1
const func dec(x: Int64) {
    x - 1
}

func h() {
    const h_LOCAL_1 = dec(111)
}

main() {
    h()
}
