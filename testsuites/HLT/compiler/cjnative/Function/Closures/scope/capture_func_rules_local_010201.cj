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

var a = {
    =>
    let a: Int32 = 1
    func foo() {
        let b: Int32 = 1
        {
            =>
            var a = a + b;
            var y = a;
            return a + y // 4
        }()
        let a: Int32 = 1
    }
    foo()
}

main(): Int64 {
    if (a() != ()) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_capture_has_shadow_variable
