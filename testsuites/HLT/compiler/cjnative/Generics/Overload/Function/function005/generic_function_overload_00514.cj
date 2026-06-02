/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class I<T> {
    public func test(a: T) {
        return 1
    }
    public func test(a: Int32) {
        return 2
    }
}

main(): Int64 {
    var res1 = I<Int16>().test(1)
    return res1
}
// ASSERT: scan sema_ambiguous_match
