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
let a = ({i: Option<Int64> => i ?? -1}, 300)

main() {
    var assert = 200
    var oa = Some(a)
    var e1 = oa?[0]

    var f1: (() -> Unit) -> Int64 = {i => 200}
    var oc = Some(f1)
    var e2 = oc? {=> 10}
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
