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
class C {
    var item = 100
}

extend Option<Int64> {
    prop pa: Int64 {
        get() {
            match (this) {
                case Some(a) => a
                case None => throw Exception()
            }
        }
    }
}

main() {
    let c = C()
    let c1 = Some(c)
    let r1 = c1?.item
    return r1.pa - 100
}
