// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A const instance field is not a RulesChecking-time match selector fact.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Point {
    let coordinate: Int64

    const init(coordinate: Int64) {
        this.coordinate = coordinate
    }
}

main() {
    const point = Point(1)
    match (point.coordinate) {
        case 2 => println("not diagnosed before CTFE")
        case _ => println("const field fallback")
    }
}

/* SCAN
*/
