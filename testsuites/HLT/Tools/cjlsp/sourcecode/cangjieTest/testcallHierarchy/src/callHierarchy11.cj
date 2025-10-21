/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

public func f5():Unit{
    var a = CA2().ha
    var b = CA2()
    b.ha2()
    b.redef
}

interface AI{
    func ha(){}
    func redef(){}
}

class CA2 <: AI{
    func ha2(){}
}
