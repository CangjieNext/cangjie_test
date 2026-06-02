// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan-begin-txt 2020/12
// ASSERT: scan-next-txt 2020/12

enum TimeUnit1<T> {
    Year(T)
    | Month(T)
    | Day
    | Two1(TimeUnit1<T>, TimeUnit1<T>)
    | Two2(TimeUnit1<String>, TimeUnit1<String>)
}

func run1(): Int64 {
    let time = Two1(Year(2020), Month(12))
    let matchValue: Int64 = match (time) {
        case Year(x) => x
        case Month(y) => y
        case Day => 24
        case Two1(x, y) =>
            let year = match (x) {
                case Year(p) => p
                case Month(q) => q
                case Day => 24
                case Two1(p, q) => 1
                case Two2(x, y) => 1
            }
            let month = match (y) {
                case Year(p) => p
                case Month(q) => q
                case Day => 24
                case Two1(p, q) => 1
                case Two2(x, y) => 1
            }
            print("${year}/${month}\n")
            123
        case Two2(x, y) => 1
    }
    if (matchValue != 123) {
        return 1
    }
    return 0
}

func run2(): Int64 {
    let time = Two2<Unit>(Year("2020"), Month("12"))
    let matchValue: Int32 = match (time) {
        case Year(x) => 1
        case Month(y) => 2
        case Day => 3
        case Two1(x, y) => 4
        case Two2(x, y) =>
            let year = match (x) {
                case Year(p) => p
                case Month(q) => q
                case Day => "2"
                case Two1(p, q) => "3"
                case Two2(x, y) => "4"
            }
            let month = match (y) {
                case Year(p) => p
                case Month(q) => q
                case Day => "2"
                case Two1(p, q) => "3"
                case Two2(x, y) => "4"
            }
            print("${year}/${month}\n")
            123
    }
    if (matchValue != 123) {
        return 1
    }
    return 0
}

main(): Int64 {
    if (run1() != 0 || run2() != 0) {
        return 1
    }
    return 0
}
