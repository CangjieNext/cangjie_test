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
func a() {
    func test(a: Int8): Int8 {
        return 1
    }
}

func b() {
    func test(a: Int16): Int16 {
        return 2
    }
}

main(): Int64 {
    return 0
}
