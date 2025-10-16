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
func demoinfun(): Int64 {   //设置断点：小括号10/12 大括号13/15
    var hundredk: Int64 = 1
    while
    (
        hundredk < 10
        )
        {
        hundredk++
    }
    //设置断点：注释行16
    //设置断点：中括号19/21
    var a : Array<Int32> = (
        [
          foo(), 2, 3]
    )

    """
    多行字符串测试//设置断点： 23-26

    """

    var owni: Int64 = 5
    return owni
}

func foo(): Int32{
    return 20
}















