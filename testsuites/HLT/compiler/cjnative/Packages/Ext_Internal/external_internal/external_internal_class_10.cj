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
    var value = 9
}

public class A {
    public mut prop a: Aoo {
        get() {
            Aoo()
        }
        set(value) {
            var b: Aoo = Aoo()
            b = value
        }
    }
}

main(): Int64 {
    var x = A()
    x.a = Aoo()
    if (x.a.value == 9) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_accessibility
