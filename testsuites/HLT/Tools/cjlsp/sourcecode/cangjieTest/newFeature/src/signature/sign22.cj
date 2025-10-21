/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

open class U1{}
class U2 <: U1{}

open class S1{}
class S2 <:S1{}

func f(a:U1):S2 {S2()}
func g(a:U2):S1 {S1()}

func h(lam:(U2) ->S1):S1 {
    lam(U2())
}

func test22(){
    g(U2())
    f(U2())
    h(g)
    h(f)
}
