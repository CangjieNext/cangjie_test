// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// (DEBUG_OPTION)EXEC: %diff %n.expect.out %n.real.out
// (CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_three` of 6 expressions to one of 9 expressions.
// (CJNATIVE) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_nine` of 4 expressions to one of 9 expressions.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

struct Numbers {
    let value: Int64 = 0
    let extraValue: Int64 = 1
    let lastValue: Int64

    const init(value: Int64) {
        lastValue = value
    }
}

const func makeNumbers(valueMinus1: Int64): Numbers {
    Numbers(valueMinus1 + 1)
}

func localInts() {
    const three = Numbers(3)
    const nine = makeNumbers(8)
    println("three: " + three.value.toString())
    println("       " + three.extraValue.toString())
    println("       " + three.lastValue.toString())
    println("nine: " + nine.value.toString())
    println("      " + nine.extraValue.toString())
    println("      " + nine.lastValue.toString())
}

main() {
    localInts()
}
