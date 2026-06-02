/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output

func test(a!: Int8 = 1, b!: Int16 = 1) {}

func test(a: Int8, b!: Int8 = 1) {}

main(): Int64 {
    test(Int8(1))
    return 0
}
