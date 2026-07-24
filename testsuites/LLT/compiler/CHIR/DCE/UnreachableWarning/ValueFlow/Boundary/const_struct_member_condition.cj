// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A const struct field is not a RulesChecking-time value-flow fact.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Point {
    let coordinate: Int64

    const init(coordinate: Int64) {
        this.coordinate = coordinate
    }
}

const point = Point(1)

main() {
    if (point.coordinate < 0) {
        println("not diagnosed before CTFE")
    }
}

/* SCAN
*/
