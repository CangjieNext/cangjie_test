/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_accessibility

protected class T_a<T> {
    var a: T
    public init(temp: T) {
        a = temp
    }
}

public func test(): T_a<Int64> {
    var a = T_a<Int64>(1)
    return a
}

main() {
    return 0
}
