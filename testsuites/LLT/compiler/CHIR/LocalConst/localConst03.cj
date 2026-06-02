// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (not Windows and CJNATIVE) ASSERT: scan-1 [readOnly] [compileTimeVal] [compilerAdd] @_CN7default1AL_4bbbbK_E: Int64& = 2
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {
    var b = {=> const bbbb = 2}
    init() {}
    init(x: Int64) {}
}

main(): Int64 {
    return 1
}
