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

enum Date<T> {
    Day(T)
}

enum Time<T> where T <: Date<String> {
    Day(T)
}

func run(): Int64 {
    var date: Date<String> = Date<String>.Day("enum")
    var time: Time<Date<String>> = Time<Date<String>>.Day(date)
    var res: String = match (time) {
        case Day(x) => match (x) {
            case Day(x) => x + "!"
        }
    }
    if (res == "enum!") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
