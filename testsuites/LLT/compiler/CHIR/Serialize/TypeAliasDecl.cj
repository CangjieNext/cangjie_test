// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitRawCHIR --output-type staticlib
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

public  // Modifier
type INT  // custom type name
= Int64  // type

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
