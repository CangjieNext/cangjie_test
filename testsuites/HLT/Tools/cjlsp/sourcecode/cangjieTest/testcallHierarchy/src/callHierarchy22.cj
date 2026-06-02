/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

import std.math.*
//标准库函数调用了另一标准库函数
class MM <: Resource{
    public func isClosed(): Bool {return true}
    public func close(): Unit {
        var tt:UInt16 = 98
        var t1 = reverse(tt)
    }
}
func f22(){
    var tt:UInt16 = 98
    var t1 = reverse(tt)
    var t2 = MM()
    t2.close()
}
