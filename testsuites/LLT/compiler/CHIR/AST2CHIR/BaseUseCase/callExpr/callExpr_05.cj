// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (CJNATIVE and not Windows) ASSERT: scan-1 Class-_CN7default1AE& = InvokeStaticWithException(ThisType: This&, f1: () -> Class-_CN7default1AE&, %1, normal: #5, exception [ Class-_CNat9ExceptionE ]: #3)

open class A {}

interface I {
    static func f1(): A
    static func f2(): Unit {
        try {
            f1()
        } catch (e: Exception) {
        }
    }
}

main() {
    0
}
