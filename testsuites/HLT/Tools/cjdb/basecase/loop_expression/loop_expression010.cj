/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1{
    XY
    static func test(){
        var sum = 0
        for (i in 1..=100) {
            sum += i
        }
    }
}


main() {
    var a = E1.test()
    0
}
