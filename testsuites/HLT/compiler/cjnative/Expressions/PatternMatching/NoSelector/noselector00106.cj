/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


func test(): Int64 {
    let i = (("Allen", 90), ("Jack", 60))
    match {
        case i in ((_, _), secondStudent@ (_, _)) => "The info of the second student is: ${secondStudent[0]} got ${secondStudent[1]}"
        case _ => "default"
    }
    return 0
}

main(): Int64 {
    return test()
}
// ASSERT: scan parse_expected_double_arrow_in_case
