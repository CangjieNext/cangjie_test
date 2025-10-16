// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR_Debug/[0-9]*\_CreateVTableAndUpdateFuncCall.chir | compare %f
// (CJNATIVE and not Windows) ASSERT: scan [static] [public] [final] Func @_CN7default1I2f2Hv() : Unit
// (CJNATIVE and not Windows) ASSERT: regex Class-_CN7default1AE& = InvokeStatic\(ThisType: This&, f1: \(\) -> Class-_CN7default1AE&, %\d+\)

open class A {}

interface I {
    static func f1(): A
    static func f2(): Unit {
        f1()
    }
}

main() {
    0
}
