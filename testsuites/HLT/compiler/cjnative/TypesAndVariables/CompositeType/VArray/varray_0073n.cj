/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct Ac<T> {
    var a: T
    init(a: T) {
        this.a = a
    }
}

main(): Int64 {
    var varr: VArray<Ac<Int64>, $2> = [Ac<Int32>(-1), Ac<Int64>(1)]
    return varr[0].a + varr[0].a
}
// ASSERT: scan sema_mismatched_types
