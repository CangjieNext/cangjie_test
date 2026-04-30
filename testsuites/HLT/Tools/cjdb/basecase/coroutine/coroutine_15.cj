/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
let m = Monitor()

func test(a:Int64){
    var b = 1
    0
}

main(): Int64 {

    let fut = spawn {
        test(2)
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
