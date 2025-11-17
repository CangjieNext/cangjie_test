/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
let m = Monitor()


main(): Int64 {

    let fut = spawn {
        m.lock()
        m.wait()
        m.unlock()
    }

    sleep(Duration.second)

    m.lock()
    m.notifyAll()
    m.unlock()
    
    fut.get()

    return 0
}
