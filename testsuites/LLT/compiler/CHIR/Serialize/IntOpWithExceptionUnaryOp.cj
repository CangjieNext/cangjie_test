// LEVEL: 0
// EXEC: mkdir output
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR --output-type staticlib
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitRawCHIR --output-type staticlib
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

let a = 0

func foo () {
    try {
        return -a
    } catch (e: OverflowException) {
        return 0
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
