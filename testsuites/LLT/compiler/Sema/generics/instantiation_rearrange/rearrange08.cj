// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-1 in extend1
// ASSERT: scan-1 in extend2

public enum A {
    | AAA
}

extend A {
    private func foo() {
        println("in extend1")
    }
    public func goo1() {
        foo()
    }
}

extend A {
    private func foo() {
        println("in extend2")
    }
    public func goo2() {
        foo()
    }
}

main() {
    A.AAA.goo1()
    A.AAA.goo2()
    0
}
