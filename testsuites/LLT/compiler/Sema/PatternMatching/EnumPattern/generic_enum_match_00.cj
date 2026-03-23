// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

enum Color<T> {
    Red(T) | Green(T) | Blue(T)
}

func getColor(): Color<Int64> {
    return Color<Int64>.Red(42)
}

main() {
    let c: Color<Int64> = getColor()
    match (c) {
        case Red(v) => println("Red(${v})")
        case Green(v) => println("Green(${v})")
        case Blue(v) => println("Blue(${v})")
    }
}

/* SCAN
Red(42)
*/
