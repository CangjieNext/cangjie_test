/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let b = Array<String>(3, {
        i => match (i) {
            case 0 => "a"
            case _ => "c"
        }
    })

    let string1: String = match (b.get(0)) {
        case Some("a") => "a"
        case Some(x) => x
        case None => ""
    }

    let string2: String = match (b.get(1)) {
        case Some("c") => "c"
        case Some(x) => x
        case None => ""
    }

    let string3: String = match (b.get(2)) {
        case Some("c") => "c"
        case Some(x) => x
        case None => ""
    }

    if (string1 != "a" || string2 != "c" || string3 != "c" || b[0] != "a" || b[1] != "c" || b[2] != "c") {
        return 2
    }
    return 0
}
