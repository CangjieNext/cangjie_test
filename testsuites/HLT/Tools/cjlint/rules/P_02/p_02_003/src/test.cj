struct Demo<T> {
    var res: Int8 = 1
}
var r = Demo<Int8>()
main(): Int64 {
    var i: Int64 = 0
        while (i < 100) {
            i++
            spawn {
                r.res = r.res + 1
            }
        }
    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
