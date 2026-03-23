// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan RedGreenBlue

enum Color<T> {
    Red(T) | Green(T) | Blue(T)
}

func makeRed<T>(v: T): Color<T> {
    return Color<T>.Red(v)
}

func makeGreen<T>(v: T): Color<T> {
    return Color<T>.Green(v)
}

func makeBlue<T>(v: T): Color<T> {
    return Color<T>.Blue(v)
}

main() {
    let colors: Array<Color<Int64>> = [makeRed(1), makeGreen(2), makeBlue(3)]
    for (c in colors) {
        match (c) {
            case Red(_) => print("Red")
            case Green(_) => print("Green")
            case Blue(_) => print("Blue")
        }
    }
}
