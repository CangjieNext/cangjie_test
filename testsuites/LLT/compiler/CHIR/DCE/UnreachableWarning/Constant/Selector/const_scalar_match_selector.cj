// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify const scalar selectors make non-matching cases unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-4 "DiagKind": "chir_unreachable_pattern"

func numericSelector() {
    const number = 1 + 2
    match (number) {
        case 4 => println("unreachable number case")
        case _ => println("number fallback")
    }
}

func boolSelector() {
    const flag = true
    match (flag) {
        case false => println("unreachable Bool case")
        case _ => println("Bool fallback")
    }
}

func floatSelector() {
    const ratio: Float64 = 1.0
    match (ratio) {
        case 2.0 => println("unreachable Float case")
        case _ => println("Float fallback")
    }
}

func runeSelector() {
    const letter = r'a'
    match (letter) {
        case r'b' => println("unreachable Rune case")
        case _ => println("Rune fallback")
    }
}

main() {
    numericSelector()
    boolSelector()
    floatSelector()
    runeSelector()
}
