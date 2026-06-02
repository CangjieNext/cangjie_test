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

import std.collection.*

public type Tag = UInt32

var v = HashMap<Tag, Int64>()

extend Tag {
    public prop tagSize: Int64 {
        get() {
            if (this < (1 << 4)) {
                return 1
            }
            if (this < (1 << 11)) {
                return 2
            }
            if (this < (1 << 18)) {
                return 3
            }
            if (this < (1 << 25)) {
                return 4
            }
            5
        }
    }
}

func getOneofIndex(): ?HashMap<Tag, Int64> {
    Some(v)
}

main() {
    var tag: Tag = 1
    v.add(tag, 1)
    var a = 1
    while (let Some(Some(1)) <- getOneofIndex()?.get(tag)) {
        a--
        break;
    }
    return a
}
