/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class CC {
    public operator func +(right: Any) {
        return right
    }
}

main(): Int64 {
    let f = {a => CC() + (a)}
    if (f is (Any) -> Any) {
        return 0
    }
    return 1
}
