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

public interface A {
    func foo1(): Bool
    func foo2() {
        0
    }
}

public class B <: A {
    public func foo1() {
        return true
    }
}

main(): Int64 {
    if (B().foo1()) {
        return B().foo2()
    }
    return 1
}
