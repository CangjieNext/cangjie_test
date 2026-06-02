// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: p1
// (DEBUG_OPTION)EXEC:%compiler  p1/test0.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC:%compiler  %dumpCHIRDebug %cmp_opt test0.%middle test1.cj -o %output
// (not CJNATIVE and not Windows and DEBUG_OPTION)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/[0-9]*\_AST_CHIR.chir | compare %f

internal import test0.*

func highOrderF(fVal: (Int64, Nothing) -> Int64) {
    return 2
}

func highOrderF1(fVal: (Nothing, Nothing) -> Int64) {
    return 2
}

main() {
    var lambdaVal = {
        => highOrderF(foo)
    }
    highOrderF(foo)
    highOrderF(foo)
    highOrderF1(foo)
    highOrderF1(foo)
    0
}

// (not CJNATIVE and not Windows)ASSERT: regex-3 Lambda\[@_ZN7default6<main>Ev\$va_typecast\d+\]
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
