/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass

import std.collection.*

var objects: ArrayList<Object> = ArrayList<Object>()

func poll() {
    var a = objects.get(0)
    var b: Object = Object()

    return match (a) {
        case Some(x) => x
        case None => b
    }
}

main() {
    var res: Object = poll()
    println("pass")
}
