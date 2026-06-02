/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
var count: Int64 = 0
let m = Monitor()

func son_thread():Future<Unit>{
    let fut = spawn {
        m.lock()
        m.wait()
        m.unlock()
    }
    return fut

}

main(): Int64 {

    var fut = son_thread()
    sleep(Duration.second)
    m.lock()
    m.notifyAll()
    m.unlock()
    // Wait for all threads finished.
    fut.get()
    return 0
}
