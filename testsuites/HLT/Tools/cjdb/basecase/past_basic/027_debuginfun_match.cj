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
func demoinfun(): Int64 {   //设置断点：8/11/16/18行，第11和18行设置断点后，显示失败图标
    let score: Int64 = 90
    let PASS = 60
    let FULL = 100
    var scoreResult: Int64 = match (score) { //scoreResult = 5
        case 0 => 1
        case 10 | 20 | 30 | 40 | 50 => 2
        case 60 => 3
        case 70 | 80 => 4
        case 90 | 100 => 5
        case _ => 0
    }
    return scoreResult
}









