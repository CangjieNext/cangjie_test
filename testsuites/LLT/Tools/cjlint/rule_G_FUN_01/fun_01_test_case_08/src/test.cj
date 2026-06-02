// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let f1: () -> Unit = { => 
    for (i in 0..3) {
        if (true) {
            if (true) {
            } else {
                if (true) {
                    var j = 0
                    while (j < 2) {                    
                        println(i)
                        j += 1
                    }
                }
            }
        }
        println(i)
    }    
}