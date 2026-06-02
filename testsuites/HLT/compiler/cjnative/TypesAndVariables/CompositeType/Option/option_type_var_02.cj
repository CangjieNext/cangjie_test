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

func foo<T>(x: Option<T>): Option<T> {
    return x
}

func run(): Int64 {
    var opt1: Option<String> = Some<String>("Option")
    var opt2: Option<String> = None<String>
    var res1: String = match (foo<String>(opt1)) {
        case Some(x) => x
        case None => ""
    }
    var res2: String = match (foo<String>(opt2)) {
        case Some(x) => x
        case None => ""
    }
    if (res1 == "Option" && res2 == "") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
