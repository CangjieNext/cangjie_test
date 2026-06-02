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

enum Date {
    Day(Int32)
}

enum Time<T> where T <: Date {
    Day(T)
}

func run(): Int64 {
    var date: Date = Date.Day(14)
    var time: Time<Date> = Time<Date>.Day(date)
    var res: Int32 = match (time) {
        case Day(x) => match (x) {
            case Day(x) => x + 1
        }
    }
    if (res == 15) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
