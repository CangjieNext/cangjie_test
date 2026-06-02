/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C1 {}

class C2 {}

class A<T> {}

extend A<C1> {
    public func f1(): Bool {
        true
    }
}

extend A<C2> {
    public func f2(): Bool {
        false
    }
}

main(): Int64 {
    var res = A<C1>().f1()
    if (res) {
        return 0
    }
    return 1
}
