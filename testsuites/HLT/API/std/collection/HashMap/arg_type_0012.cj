/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

class Data {
    public Data(var a: HashMap<Int32, Bool>) {
        this.a = a
    }
}

func run(): Bool {
    var value: Data = Data(HashMap<Int32, Bool>([(1, true), (2, false)]))
    match (value.a.get(1)) {
        case Some(true) => true
        case Some(false) => false
        case _ => false
    }
}

main(): Int64 {
    if (run()) {
        return 0
    };
    return 1
}
