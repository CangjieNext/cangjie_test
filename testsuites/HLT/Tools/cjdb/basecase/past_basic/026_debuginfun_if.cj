/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8-19行 //不会执行到的代码：13/16
    var if001: Bool = true
    var if_a: Int64 
    if (if001) {
        if_a = 1   //if_a = 1
    } else {
        if_a = 2
    }
    if (!if001) {
        if_a = 1   
    } else {
        if_a = 2    //if_a = 2
    }
    return if_a
}








