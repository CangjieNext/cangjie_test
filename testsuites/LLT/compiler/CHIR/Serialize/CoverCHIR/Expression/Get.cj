// LEVEL: 0
// (DEBUG_OPTION) EXEC: %compiler %cmp_opt %f %dumpCHIRDebug %emitOptCHIR
// (DEBUG_OPTION) EXEC: %chirDis default.chir
// (CJNATIVE and DEBUG_OPTION) EXEC: %cat *_Emit_Debug.chirtxt | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan GetRTTI(
// (DEBUG_OPTION) EXEC: diff *_Emit_Debug.chirtxt default.chirtxt


open class A {
    public static func f() {
        return 11
    }
 
    func bar() {
        f()
    }
 
    static func baz() {
        f()
    }
}
 
class C2 <: A {
    public redef static func f() {
        return 12
    }
 
}
 
main() {
    let a: A = C2()
    println(a.bar())
 
    println(A.f())
    println(C2.baz())
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
