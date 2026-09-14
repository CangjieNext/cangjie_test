// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify declaration-order Nothing argument evaluation and outer-call continuations.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-12 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing {
    throw Exception()
}

func consume(first: Int64, second: Int64, third: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func consumeNamed(first!: Int64, second!: Int64, third!: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func consume(value: Int64) {
    if (value < 0) {
        return
    }
}

extend Nothing {
    func consume(value: Int64) {
        if (value < 0) {
            return
        }
    }
}

func firstUnreachedArgument(): Int64 { 1 }
func secondUnreachedArgument(): Int64 { 2 }
func value(): Int64 { 1 }

func firstNothingArgument(): Int64 {
    consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
    println("unreachable after first Nothing argument")
    0
}

func middleNothingArgument(): Int64 {
    consume(value(), stop(), firstUnreachedArgument())
    println("unreachable after middle Nothing argument")
    0
}

func lastNothingArgument(): Int64 {
    consume(value(), value(), stop())
    println("unreachable after last Nothing argument")
    0
}

func throwNothingArgument(): Int64 {
    consume(value(), throw Exception(), firstUnreachedArgument())
    println("unreachable after throw argument")
    0
}

func nothingReceiver(): Int64 {
    stop().consume(value())
    println("unreachable after Nothing receiver")
    0
}

func nothingCallee(): Int64 {
    stop()(value())
    println("unreachable after Nothing callee")
    0
}

func namedArgumentDeclarationOrder(): Int64 {
    consumeNamed(third: stop(), first: value(), second: value())
    println("unreachable after declaration-order named call")
    0
}

main() {
    consume(0, 0, 0)
    consume(0)
    firstUnreachedArgument()
    secondUnreachedArgument()
    value()
    firstNothingArgument()
    middleNothingArgument()
    lastNothingArgument()
    throwNothingArgument()
    nothingReceiver()
    nothingCallee()
    namedArgumentDeclarationOrder()
}
