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
    var a = 0
    if (case01() != 2 || match (case01()) {
        case a: Int32 => 1;
        case a: Int64 => 0;
        case _ => 2
    } != 0) {
        return 1
    }
    if (case02() != 2 || match (case02()) {
        case a: Int32 => 1;
        case a: Int64 => 0;
        case _ => 2
    } != 0) {
        return 2
    }
    if (case05()[1] != 2 || match (case05()) {
        case a: (Int32, Int32) => 1;
        case a: (Int64, Int64) => 0;
        case _ => 2
    } != 0) {
        return 5
    }
    //    if (case06().get(1) != 2 || match case05() { case a: List<Int32> => 1;case a: List<Int64> => 0 ;case _ => 2} != 0) {
    //        return 6
    //    }
    if (case06()[1] != 2) {
        return 6
    }
    return 0
}

func case01() {
    2
}

func case02() {
    case01()
}

func case05() {
    (1, 2)
}

func case06() {
    [1, 2, 3] // List
}
