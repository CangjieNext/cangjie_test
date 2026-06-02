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
let a = {i: Int64 => {j: Option<Int64> => Some(200)}}
let d = {i: () -> Unit => 100}

main() {
    var assert = 200
    var oa = Option<(Int64) -> ((Option<Int64>) -> Option<Int64>)>.Some(a)
    var e1 = oa?(1)
    var oc = Some<(() -> Unit) -> Int64>(d)
    var e2 = oc? {=> ()}
    var res = e1?(e2)
    match (res) {
        case Some(x) =>
            if (x != assert) {
                return 1
            }
        case None => return 2
    }
    return 0
}
