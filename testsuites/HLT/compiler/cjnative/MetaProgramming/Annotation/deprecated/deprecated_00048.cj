/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_deprecated_invalid_target


class A {
    private var value: Int64 = 0
    public mut prop i: Int64 {
        get() {
            value
        }
        
        set(@Deprecated v) {
            value = v
        }
    }
}

main() {
    A()
    return 1
}
