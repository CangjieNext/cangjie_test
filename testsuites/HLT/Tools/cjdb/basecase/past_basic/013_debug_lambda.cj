/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() { //设置断点：4/5/6/7/8 第5/7行设置断点后，显示失败图标
    let f1: (Int64, Int64)->Int64 = {a: Int64, b: Int64 
        => 
        a + b
    }
    var lamdba001: Int64 = f1(10, 10)
    return lamdba001
}




