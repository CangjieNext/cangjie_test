/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type str = String

func add(a: str): str {
    return a
}

func add(a: String, b: String): String {
    return a + b
}

main(): Int64 {
    if (add("类型别名") == "类型别名" && add("重载", "原类型") == "重载原类型") {
        return 0
    } else {
        return 1
    }
}
