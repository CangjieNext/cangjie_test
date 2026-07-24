// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nested Option values are not propagated through an if-let pattern.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

main() {
    let value = Option<Option<Int64>>.Some(Option<Int64>.Some(1))
    if (let Some(Some(number)) <- value) {
        println(number)
    } else {
        println("not diagnosed")
    }
}
