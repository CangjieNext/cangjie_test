/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Interface

interface I8 {
    func f(): Unit
}
interface I8_2 {
    func f(): Unit {}
}
open class A8 {
    public open func f(): Unit {}
}
class B8 <: A8 & I8 & I8_2 {
    public func f(): Unit {}
}

func mai8n(){
    B8().f()

}
