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
func demoinfun(): Int64 {   //设置断点：8/9/10/11 第9行不能设置断点
    var hundredo = 0
    do {
        hundredo++ //hundredo先自加1后进入while循环
    } while (hundredo < 10)
    return hundredo
}







