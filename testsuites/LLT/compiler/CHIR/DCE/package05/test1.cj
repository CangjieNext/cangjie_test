// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: p1
// (CJNATIVE and DEBUG_OPTION) EXEC:%compiler %disableReflection %enableO2 p1/test0.cj %compile_lib_opt -o test0.%middle
// (CJNATIVE and DEBUG_OPTION) EXEC:%compiler %dumpCHIRDebug %disableReflection %enableO2 test0.%middle test1.cj -o %output 2>&1
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/0\_AST\_CHIR.chir | %grep "\ Func\ " | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %output

internal import test0.*

main() {
    let a = B<Int64>()
    return 0
}

// (CJNATIVE) ASSERT: scan-not @_CN5test01AIGTE3gooEv
// (CJNATIVE) ASSERT: scan-not core dumped
// (CJNATIVE) ASSERT: scan-not stack trace