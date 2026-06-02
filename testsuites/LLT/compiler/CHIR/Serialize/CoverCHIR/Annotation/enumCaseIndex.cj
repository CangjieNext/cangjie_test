// (CJNATIVE) LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// (CJNATIVE) EXEC: %chirDis default.chir

// (CJNATIVE) EXEC: %cat *_Emit_Debug.chirtxt | compare %f
// (CJNATIVE) ASSERT: scan EnumCaseIndex:

// (CJNATIVE) EXEC: diff *_Emit_Debug.chirtxt default.chirtxt

enum E {
    A(Int64) | B(Int64)
}

func foo (e :E) : Int64 {
    match (e) {
        case A(n) => 0
        case B(n) => 1
    }
}
// extend Int64 <: I1 {}
main(): Int64 { 
    var a = A(0)
    foo(a)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
