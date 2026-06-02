/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_generic_argument_no_match

struct A<T, K> {}

extend<T, K> A<(T, K)> {
    mut prop b: T {
        get() {
            1
        }
        set(value) {
            a = value
        }
    }
}

main(): Int64 {
    var res = A<Int64, Int32>().f1()
    if (res) {
        return 0
    }
    return 1
}
