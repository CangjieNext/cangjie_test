/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Data {
    public let rge: Range<Int64> = 0..5
    public var a: Int64
    public init(x: Int32) {
        for (i in rge) {
            a = i
        }
    }
}

main(): Int64 {
    var data1 = Data(90)
    if (data1.a == 8) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_class_uninitialized_field
