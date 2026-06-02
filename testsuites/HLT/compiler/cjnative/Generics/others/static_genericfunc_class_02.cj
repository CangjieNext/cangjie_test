/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Coo<T> {
    public static var a: Option<String> = Option<String>.None
    public static func foo<V>(x: V): Option<String> {
        return a
    }
}

main(): Int64 {
    var i: Int32 = 3
    var a: Option<String> = Coo<String>.foo<Int32>(i)
    var res = match (a) {
        case Some(x) => x
        case None => "No"
    }
    if (res != "No") {
        return 1
    }
    return 0
}
