// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler -g %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_ClosureConversion.chir | compare %f
// (CJNATIVE and not Windows and DEBUG_OPTION) ASSERT: scan Class-N15$Captured_Int64E&& = Allocate(Class-N15$Captured_Int64E&)
// (CJNATIVE and not Windows and DEBUG_OPTION) ASSERT: regex Debug\(%[0-9]+, aaa\)
// (CJNATIVE and not Windows and DEBUG_OPTION) ASSERT: scan-not core dumped
// (CJNATIVE and not Windows and DEBUG_OPTION) ASSERT: scan-not stack trace

main() {
    var aaa = 1
    func bar() {
        return aaa
    }
    0
}





