// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitRawCHIR
// EXEC: %chirDis default.chir
// EXEC: diff *_Emit_Debug.chirtxt default.chirtxt
public interface I3 {}
public // Modifier
enum E // Identifier
<T> // Generic
<: I1 // Implement 
where T <: I3
{  
    | R(Int64) // arg
    | G
}

public interface I1{

}

public interface I2{

}
main(): Int64 { 0 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
