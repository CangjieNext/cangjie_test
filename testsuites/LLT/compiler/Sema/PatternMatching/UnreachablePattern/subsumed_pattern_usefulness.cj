// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Earlier patterns make later constructor, or-pattern, and scalar patterns unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f 2>&1 | compare %f

// ASSERT: scan-5 "DiagKind": "sema_unreachable_pattern"

enum Shape {
    | Box(Int64)
    | Empty
}

func constructorWildcard(value: Shape) {
    match (value) {
        case Box(_) => 0
        case Box(1) => 1
        case Empty => 2
    }
}

enum Colour {
    | Red
    | Green
    | Blue
}

func orPatternDuplicate(value: Colour) {
    match (value) {
        case Red | Green => 0
        case Green => 1
        case Blue => 2
    }
}

func floatDuplicate(value: Float64) {
    match (value) {
        case 3.14 => 0
        case 3.14 => 1
        case _ => 2
    }
}

func runeDuplicate(value: Rune) {
    match (value) {
        case r'a' => 0
        case r'a' => 1
        case _ => 2
    }
}

func unitDuplicate(value: Unit) {
    match (value) {
        case () => 0
        case () => 1
    }
}
