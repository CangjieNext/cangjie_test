/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var a: int64<Int64> = int64<Int64>()
    if (a.n != 1) {
        return 1
    }
    a.m = 10
    if (a.m != 2) {
        return 2
    }
    return 0
}

class int64<T> {}

type I = int64<Int64>

extend I {
    private mut prop m: Int32 {
        get() {
            return 2
        }
        set(v) {}
    }
    public prop n: Int32 {
        get() {
            return 1
        }
    }
}
// ASSERT: scan sema_invalid_access_control
