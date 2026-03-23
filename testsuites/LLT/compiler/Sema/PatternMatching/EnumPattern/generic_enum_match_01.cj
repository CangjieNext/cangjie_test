// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not warning

enum Option2<T> {
    Some(T) | None
}

func getOption(): Option2<String> {
    return Option2<String>.Some("hello")
}

func getNone(): Option2<String> {
    return Option2<String>.None
}

main() {
    let o1: Option2<String> = getOption()
    match (o1) {
        case Some(v) => print("Some(${v})")
        case None => print("None")
    }

    let o2: Option2<String> = getNone()
    match (o2) {
        case Some(v) => print("Some(${v})")
        case None => print("None")
    }
}
