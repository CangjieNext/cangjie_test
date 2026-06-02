// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %diag_json %f %compile_lib_opt 2>&1 | compare %f

import std.collection.*

public var lockVers = 3
public class MyMap<V> {
    MyMap(let p: TreeMap<Int,V>) {}

    public mut prop myValue: ?V {
        get() {
            let _: (Int64) -> Unit = {
                a: Int64 =>
                if (a > 8) {
                    a
                } else {
                    println(a)
                }
            }
            throw Exception()
        }
        set(_) {
            if (lockVers > 0) {
                p.remove(1)
            } else {
                lockVers++
            }
        }
    }
}

// ASSERT: scan-not Warnings
