/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
import std.time.*

var a: Int64 = 0
var b: Int64 = 0

main(): Int64 {
    let mtx = Mutex()
    spawn {
        mtx.lock()
        a = 1
        b = 1
        mtx.unlock()
    }
    spawn {
        while (true) {
            if (a == 0) {
                continue
            }
            if (b != 1) {
                print("Fail\n")
            } else {
                print("Success\n")
            }
            break
        }
    }
    sleep(Duration.second)
    return 0
}
