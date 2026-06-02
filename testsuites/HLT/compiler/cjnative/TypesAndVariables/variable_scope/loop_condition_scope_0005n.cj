/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A <: Iterator<Int64> {
    init() {
    }

    init(a: Int64) {
    }

    public func iterator(): Iterator<Int64> {
        return this
    }

    public func next(): Option<Int64> {
        return None
    }
}

main() {
    for (i in A(i)) {
    }
    return 0
}
// ASSERT: scan sema_undeclared_identifier
