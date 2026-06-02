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
    public mut static prop foo: Option<String> {
        get() {
            return a
        }
        set(v) {
            a = v
        }
    }
}

main(): Int64 {
    var a: Option<String> = Coo<String>.foo
    var resa = match (a) {
        case Some(x) => x
        case None => "No"
    }
    if (resa != "No") {
        return 1
    }
    Coo<String>.foo = Option<String>.Some("a")
    var b: Option<String> = Coo<String>.foo
    var resb = match (b) {
        case Some(x) => x
        case None => "No"
    }
    if (resb != "a") {
        return 2
    }
    return 0
}
