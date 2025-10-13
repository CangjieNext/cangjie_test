// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitRawCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt
struct S{
    public  // Modifier
    var  // var, let, const
    a  // Identifier
    :Int64  // Type
    = 1  // Init, a) init with type    b) init without type
}

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
