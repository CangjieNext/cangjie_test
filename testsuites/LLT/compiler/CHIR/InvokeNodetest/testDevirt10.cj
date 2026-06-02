// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output %run_args
// ASSERT: scan The function call to foo in the line 29 and the column 5 was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A {
    func foo(): Int64 {
        return 2
    }
}

abstract class A1 <: A {
    
}

open class A11 <: A1 {

}

open class A12 <: A1 {

}

main() {
    var a:A = A11() // invoke
    
    a.foo() - 2
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
