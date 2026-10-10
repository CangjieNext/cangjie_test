/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// 中文注释：检查运算符与标点间距
var 总数 = 100
var 单价 = 3

func 描述(): String {
    // 字符串插值中的二元运算符
    return "总计：${总数 * 单价}元"
}

class 卡片 {
    var 名字 = "仓颉"
    func 打招呼(): Unit {
        println("你好，${this.名字}！")
    }
}

main() {
    println(描述())
    let 卡 = 卡片()
    卡.打招呼()
}
