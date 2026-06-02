/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day

    public func printValue(): Unit {
        var a = [1,2,3]
        for (i in a) {
            println(i)
        }
    }
}

main() {
    var time = Year(3).printValue()
    return 0
}
