// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output %run_args
// ASSERT: scan The function call to foo in the line 22 and the column 5 was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


package test0

public abstract class A {
    public func foo() : Int64
}

public class B <: A {
    public func foo() : Int64 {
        return 0
    }
}

func bar(a: A) {
    a.foo()          //invoke
}

main() {
    var a:A = B()
    bar(a)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
