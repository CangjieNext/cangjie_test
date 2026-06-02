/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package packageTest

class Aoo {
    var value = 6
}

public class A {
    public var a: Aoo = Aoo()
}

main(): Int64 {
    if (A().a.value == 6) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_accessibility
