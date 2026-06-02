// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

@C
unsafe func readPtr8(p: CPointer<UInt8>): UInt8 {
    return p.read()
}

var a = UInt8(1)
var b = unsafe { readPtr8(inout a) }
var c = a

main() {
    return 0
}

// ASSERT: regex-not \[ConstPropagation\] The TypeCast at \[11,.*\] has been rewrited to a constant