/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type A<K> = structA<K>

struct structA<K> {
    public var b: K
    public structA(var y: K) {
        this.b = y
    }

    public static prop e: Bool {
        get() {
            true
        }
    }
}

main(): Int64 {
    A<Bool>(A<Bool>.e)
    return 0
}
