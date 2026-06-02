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

var temp: Int64 = 1

func f1() {
    return temp - 2
}

main(): Int64 {
    let a = Array<String>(3, {
        i => match (i) {
            case 1 => "a"
            case _ => "c"
        }
    })

    var c = a.get(f1())

    let string1: String = match (c) {
        case Some("a") => "a"
        case Some("c") => "c"
        case Some(x) => x
        case None => "nothing"
    }

    if (string1 == "nothing") {
        return 0
    } else {
        return 1
    }
}
