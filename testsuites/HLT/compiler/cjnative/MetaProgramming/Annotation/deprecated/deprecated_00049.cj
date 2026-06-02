/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_unexpected_anno_on


class A {
    private var value: Int64 = 0
    public mut prop i: Int64 {
        @Deprecated 
        get() {
            value
        }
        
        set(v) {
            value = v
        }
    }
}

main() {
    var x = A()
    println(x.i)
    x.i = 1 
}

