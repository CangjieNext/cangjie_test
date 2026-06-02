/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_capture_before_initialization

func a() {
    var a: Int64
    func b() {
        do {
            a = 1
        } while (a == 0)
        return a
    }

    b()
}

main() {
    var a = a()
    return a - 1
}
