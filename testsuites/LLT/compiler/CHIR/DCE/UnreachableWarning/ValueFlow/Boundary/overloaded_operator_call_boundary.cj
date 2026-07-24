// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a user operator lowered by Sema as Apply does not provide a CHIR constant value.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Counter {
    let value: Int64

    init(value: Int64) {
        this.value = value
    }

    operator func +(other: Counter): Counter {
        Counter(this.value + other.value)
    }
}

main() {
    let result = Counter(1) + Counter(2)
    if (result.value != 3) {
        println("not diagnosed")
    }
}

/* SCAN
*/
