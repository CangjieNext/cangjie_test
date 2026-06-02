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

type int = Array<Int64>

type str = Array<String>

main(): Int64 {
    var opt1: Option<int> = Option<int>.Some([1, -1])
    var opt2: Option<Option<int>> = Option<Option<int>>.Some(opt1)
    var opt3: Option<str> = Option<str>.Some(["hello", "world"])
    var res1: int = match (opt2) {
        case Some(x) => match (x) {
            case Some(x) => x
            case None => [1, 1]
        }
        case None => [1, 1]
    }
    var res2: str = match (opt3) {
        case Some(x) => x
        case None => ["hello", "Rune"]
    }
    if (res1[0] + res1[1] == 0 && res2[0] + res2[1] == "helloworld") {
        return 0
    }
    return 1
}
