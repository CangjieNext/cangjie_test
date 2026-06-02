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

class A<T> {}

class B<T, K> {}

extend<T, K> A<B<T, K>> {
    public func f1(): Bool {
        true
    }
}

main(): Int64 {
    var res = A<B<Int64, Int32>>().f1()
    if (res) {
        return 0
    }
    return 1
}
