/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

interface I1{
    func hh():Unit
}

class C3<:I1{
    public func hh(): Unit{}
}

func test16(){
    var f1 = C3().hh()
}

