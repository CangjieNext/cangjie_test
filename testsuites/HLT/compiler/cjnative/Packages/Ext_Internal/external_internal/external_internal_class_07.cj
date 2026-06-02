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
    var value = 7
}

public class A {
    public func foo(x: Aoo): Aoo {
        return x
    }
}

main(): Int64 {
    if (A().foo(Aoo()).value == 7) {
        return 0
    } else {
        return 1
    }
}
