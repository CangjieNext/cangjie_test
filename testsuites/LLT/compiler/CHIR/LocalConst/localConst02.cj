// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (not Windows and CJNATIVE) ASSERT: scan-not Func @_CGV7default1I5$igetHvE1aK_Hv()
// (not Windows and not CJNATIVE) ASSERT: scan-not Func @gv$__ZN7default1aS9a0a0a0a0aE()

interface I {
    prop i: String {
        get() {
            const a: String = "extend"
            return a
        }
    }
}

type C = I

class A {}

extend A <: C {}

main(): Int64 {
    if ("extend" == A().i) {
        return 0
    }
    return 1
}
