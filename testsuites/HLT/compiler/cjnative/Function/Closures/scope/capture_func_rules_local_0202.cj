/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo() != 8) {
        return 1
    }
    return 0
    return 0
}

let c: Int32 = 1

func foo() {
    let a: Int32 = 1
    let b: Int32 = 1
    func foo1(a!: Int32 = a + b, y!: Int32 = a) {
        return a + y // 4
    }
    func foo2() {
        var a = a + c;
        var y = a;
        return a + y // 4
    }
    let c: Int32 = 1
    foo1() + foo2()
}
// ASSERT: scan sema_capture_has_shadow_variable
// ASSERT: scan chir2_dce_unreachable_expression
// ASSERT: scan chir_dce_unused_variable
