/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package packageTest

public class Aoo {
    var value = 29
}

public class A {
    protected mut prop a: Aoo {
        get() {
            Aoo()
        }
        set(value) {
            var b: Aoo = Aoo()
            b = value
        }
    }
    public func foo() {
        this.a
    }
}

main(): Int64 {
    var x = A()
    if (x.foo().value == 29) {
        return 0
    } else {
        return 1
    }
}
