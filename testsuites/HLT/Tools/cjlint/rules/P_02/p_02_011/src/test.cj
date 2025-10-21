/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var res: Int64 = 0
struct B<T> {
    func foo(){
        var i: Int64 = 0
        while (i < 100) {
            i++
            spawn {
                res = res + 1
            }
        }
    }
}
main(): Int64 {
    return 0
}
