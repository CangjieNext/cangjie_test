/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return 0
}

func foo() {
    var a: Int32
    let b: Int32
    func foo1(x!: Int32 = a + b) {
        return x
    }
    func foo2() {
        var x = a + b;
        return x
    }
}
// ASSERT: scan sema_capture_before_initialization
