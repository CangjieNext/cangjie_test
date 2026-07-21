// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime struct method pass

struct Calculator {
    var value: Int64

    init(value: Int64) {
        this.value = value
    }

    public func add(other: Int64): Int64 {
        value + other
    }

    public func mul(other: Int64): Int64 {
        value * other
    }

    public func divBy(other: Int64): Int64 {
        value / other
    }

    public func remainder(other: Int64): Int64 {
        value % other
    }

    public mut func increment(delta: Int64) {
        value += delta
    }

    public mut func decrement(delta: Int64) {
        value -= delta
    }
}

struct Counter {
    var count: Int64

    init(start: Int64) {
        count = start
    }

    public mut func inc(): Int64 {
        count += 1
        count
    }

    public mut func reset(): Int64 {
        count = 0
        count
    }
}

func testCalculatorImmutable(): Bool {
    let calc = Calculator(10)
    calc.add(5) == 15 && calc.mul(3) == 30 && calc.divBy(2) == 5 && calc.remainder(3) == 1
}

func testCalculatorMutable(): Bool {
    var calc = Calculator(0)
    calc.increment(10)
    calc.increment(5)
    calc.decrement(3)
    calc.value == 12
}

func testCounter(): Bool {
    var c = Counter(0)
    c.inc() == 1 && c.inc() == 2 && c.inc() == 3 && c.reset() == 0
}

main(): Int64 {
    if (!testCalculatorImmutable()) {
        return 1
    }
    if (!testCalculatorMutable()) {
        return 2
    }
    if (!testCounter()) {
        return 3
    }
    println("runtime struct method pass")
    0
}
