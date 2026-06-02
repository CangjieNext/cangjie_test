/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data {
    public var data: Int64
    public init(x: Int64) {
        data = 1
    }
    public func foo(x: Int64) {
        return 0
    }
    public static func bar(x: Int64) {
        0
    }
    public operator func +(right: Int64): Int64 {
        return this.data + right
    }
}

main(): Int64 {
    Data()
    Data(2).foo()
    Data().foo()
    Data.bar()

    Data(1) + 6
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
