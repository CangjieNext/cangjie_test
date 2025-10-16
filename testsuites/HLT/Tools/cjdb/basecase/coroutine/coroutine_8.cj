/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p3.*

import std.sync.*

main(): Int64 {
    var (fut,getList,m) = son_thread2()

    print("main thread: I am reading sheep 0\n")
    sleep(Duration.second)
    print("main thread: I am reading sheep 4\n")
    m.lock()
    m.notifyAll()
    m.unlock()
    fut.get()
    
    var getChar = func_1<Int64,String,Rune>(8,"Cangjie",r'c')
    print("${getChar}")

    for (i in 0..10){
        print("${i}\n")
        sleep(Duration.microsecond * 1)
    }

    return 0

}
