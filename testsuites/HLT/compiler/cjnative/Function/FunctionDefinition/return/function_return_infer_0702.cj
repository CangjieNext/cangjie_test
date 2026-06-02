/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != 2 || match (case01()) {
        case a: Int64 => 1;
        case a: Int32 => 0;
        case _ => 2
    } != 0) {
        return 1
    }
    if (case03<Int32>()() != 2 || match (case03<Int32>()) {
        case a: Int64 => 1;
        case a: () -> Int32 => 0;
        case _ => 2
    } != 0) {
        return 3
    }
    return 0
}

func case01() {
    var a: Int32 = 2
    a
}

func case02() {
    Int32(2)
}

func case03<T>() {
    case02
}

func case04() {
    case03<Int32>
}
