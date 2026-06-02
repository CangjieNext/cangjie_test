/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A {
    private var a: Int32 = 1
    private let b: Unit = ()
    private var aa: Rune = 'a'
    private let bb: Bool = true
    private func foo() {
    }

    private func foo1() {
    }
}

extend A {
    public func plus(): Int32 {
        a
        b
        aa
        bb
        foo()
        foo1()
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_invalid_access_control
// ASSERT: scan sema_no_match_function_declaration_for_call
