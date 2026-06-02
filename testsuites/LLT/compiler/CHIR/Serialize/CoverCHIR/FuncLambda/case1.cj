// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitRawCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt
@Frozen// Annotation
public // Modifier
func f // Identifier
// <T> // Generic Params
(m  // param identifier
!  // is named
: Int64  // type
= 1  // initializer
) // Params
: Int64 // RetType
// where T <: I1 // generic constraints
{ 
    const c = 10
    const r1 = { a: Int64, b: Int64 => a + b + c }(-5, -5) //
    r1
} 
// extend Int64 <: I1 {}
main(): Int64 { f() }


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
