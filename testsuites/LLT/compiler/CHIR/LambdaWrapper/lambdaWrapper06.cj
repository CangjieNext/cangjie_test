// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE and not Windows and DEBUG_OPTION)EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not CJNATIVE and not Windows and DEBUG_OPTION)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/[0-9]*\_AST_CHIR.chir | compare %f

func highOrderF(fVal: (Int64, (Int64, (Int64, Nothing) -> Int64) -> Int64) -> Int64) {
    return 2
}

func highOrderF1(fVal: (Int64, (Int64, (Nothing, Nothing) -> Int64) -> Int64) -> Int64) {
    return 2
}

func foo(x: Int64, b: (Int64, (Int64, Int64) -> Int64) -> Int64): Int64 {
    0
}

func highOrderF2(fVal: (Int64, (Int64, (Int64, (Int64, (Int64, Nothing) -> Int64) -> Int64) -> Int64) -> Int64) -> Int64) {
    return 2
}

func foo1(x: Int64, b: (Int64, (Int64, (Int64, (Int64, Int64) -> Int64) -> Int64) -> Int64) -> Int64): Int64 {
    0
}

main() {
    let lambdaVal = {
        x: Int64, y: (Int64, (Int64, Int64) -> Int64) -> Int64 => x
    }
    highOrderF(foo)
    highOrderF(lambdaVal)
    highOrderF2(foo1)
    highOrderF1(foo)
    0
}

// (not CJNATIVE and not Windows)ASSERT: regex-14 Lambda\[@_ZN7default6<main>Ev\$va_typecast\d+\]
