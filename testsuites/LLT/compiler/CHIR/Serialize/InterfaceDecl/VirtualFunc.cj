// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitRawCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt
interface S
{
    @OverflowThrowing // Annotation
    mut// Modifier
    func get  // Identifier
    (a  // Param name
    !  // is named
    :Int64  // param type
    ) 
    :Int64 // RetType
    {
        0   // a) body change with type, b) body change without type
    }
}

main(): Int64 { 0 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
