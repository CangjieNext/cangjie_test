/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
let g: ((Int64) -> Int64) -> (Int64, Int64) = {i: (Int64) -> Int64 => (i(100), 300)}

main() {
    let a = Some(g)
    var e = (a? {i: Int64 => i + 100})?[0]
    if ((e ?? -1) != 200) {
        return 1
    }
    return 0
}
