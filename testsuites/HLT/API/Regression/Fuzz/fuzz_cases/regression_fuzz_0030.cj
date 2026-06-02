/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output




var flag = 0
var sum: String = ""

func add(a: String, b: String): String {
    sum = a + b
    return sum
}

main(): Int64 {
    let fut1: Future<String> = spawn {
        return add,"cang", "jie")
        return add("", "")
        flag = 1
    }
    while(flag == 0) {sleep(Duration.millisecond)}
    print(sum)
    return 0
}
// ASSERT: scan parse_expected_character
