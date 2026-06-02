/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

interface I1{
    func foo():Unit
}

class AC1 <: I1{
    public func foo():Unit {
        fa()
    }
    func fa(){
        foo()
    }
}

func f19(){
    var aa = AC1().foo()
}
