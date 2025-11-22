/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

enum E3 {
    Year | Month

    prop i: Int64 {
        get() {
            return 0
        }
    }
    static func gg(){}
}

func tesdt4(){
    var a = E3.Month
    var b = a.i
    var c = E3.gg()
}
