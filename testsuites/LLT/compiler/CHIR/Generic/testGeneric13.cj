// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

public enum Enum_1695062022499_19 {
    defaultValue
    | enumValue_1(Int64)
}

func foo<T>() {
    match (Option<Enum_1695062022499_19>.Some(Enum_1695062022499_19.enumValue_1(1))) {
        case Some(enumValue_1(1)) => 1
        case _ => 0
    }

    0
}

main() {
    foo<Int64>()
    0
}
