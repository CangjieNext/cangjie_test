/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

struct Data {
    public var width: Int32 = 3
    public init() {}
}

enum Time<T> where T <: Data {
    Day(T)
}

func run(): Int64 {
    var data = Data()
    var time = Time<Data>.Day(data)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
