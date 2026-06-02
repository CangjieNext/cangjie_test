/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

var c: Int32 = 0

class R {
    public func a(a: Int32, b!: Bool = true) {
        c = 10
        if (b) {
            c = 5
        }
    }
}

let b = R().a

main(): Int64 {
    b(1)
    return Int64(c - 5)
}
// ASSERT: scan sema_wrong_number_of_arguments
