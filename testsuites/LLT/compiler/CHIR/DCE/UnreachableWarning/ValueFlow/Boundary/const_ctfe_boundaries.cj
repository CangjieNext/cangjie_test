// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// CTFE-only values do not become RulesChecking value-flow facts.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-not "DiagKind":

const func currentValue(): Int64 {
    1
}

const func increment(value: Int64): Int64 {
    value + 1
}

struct Threshold {
    const Threshold(let value: Int64) {}

    const func isNegative(): Bool {
        value < 0
    }
}

struct Point {
    let coordinate: Int64

    const init(coordinate: Int64) {
        this.coordinate = coordinate
    }
}

const globalPoint = Point(1)

main() {
    if (currentValue() < 0) {
        println("not diagnosed through a free const call")
    }

    const input = 1
    const result = increment(input)
    if (result < 0) {
        println("not diagnosed through a const argument")
    }

    const initialized = currentValue()
    if (initialized < 0) {
        println("not diagnosed through a const initializer")
    }

    const selector = currentValue()
    match (selector) {
        case 2 => println("not diagnosed through a const match selector")
        case _ => println("const function fallback")
    }

    const threshold = Threshold(1)
    if (threshold.isNegative()) {
        println("not diagnosed through a const member call")
    }

    if (globalPoint.coordinate < 0) {
        println("not diagnosed through a const struct member")
    }

    const localPoint = Point(1)
    match (localPoint.coordinate) {
        case 2 => println("not diagnosed through a const field selector")
        case _ => println("const field fallback")
    }
}
