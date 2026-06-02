// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not throw exception
// ASSERT: scan finally is executed
// ASSERT: scan-not hello demo_111

class Demo {
    public func demo_111() {
        println("hello demo_111")
    }
}

class Foo {
    let foo_var_11: Unit = ()
    func foo_func_10() {
        func foo_func_11(): Demo {
            try {
                Option<Range<Int16>>.None.getOrThrow();
                println("throw exception")
                Demo()
            } finally {
                println("finally is executed")
                return Demo()
            }
        }
        foo_func_11().demo_111()
    }
}

main() {
    Foo().foo_func_10()
}
