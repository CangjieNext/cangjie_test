// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not unused function:'f1'

public open class B {
    public open func foo() {
        return 0
    }
}

class C <: B {
    public override func foo() {
        return 1
    }
}

main() {
    var c: B = C()
    var d = c.foo
    println(d())
    return 0
}
