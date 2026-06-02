/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_accessibility_with_main_hint

protected var test = T_a<Int64>(1)
public var temp_test = test.a

internal struct T_a<T> {
    public var a: T
    public init(temp: T) {
        a = temp
    }
}

main() {
    return temp_test - 1
}
