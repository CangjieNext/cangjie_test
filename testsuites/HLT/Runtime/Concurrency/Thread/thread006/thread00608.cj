/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// ASSERT: scan Invalid system property value: -1
// ASSERT: scan Failed to set property jet.fiber.carrier.count

func add(a: Int64, b: Int64): Int64 {
    return a - b
}

main() {
    let res: Int64 = spawn {
        add(1, 1)
    }.get()
    return 0
}
