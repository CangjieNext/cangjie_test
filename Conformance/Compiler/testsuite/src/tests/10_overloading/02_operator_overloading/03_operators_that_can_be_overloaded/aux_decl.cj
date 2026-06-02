/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:    Aux file with class with overloaded operators, which is shared by assertions.
  @Structure:      complex-aux
  @CompileWarning: no
*/

class C {
    let s : String

    C(str : String) { s = str }

    operator func ()() { C("${s}()") }

    operator func [](other : C) { C("${s}[]") }

    operator func !() { C("${s}!") }

    operator func -() { C("${s}-") }

    operator func **(other : C) { C("${s}${other.s} **") }

    operator func *(other : C) { C("${s}${other.s} *") }

    operator func /(other : C) { C("${s}${other.s} /") }

    operator func %(other : C) { C("${s}${other.s} %") }

    operator func +(other : C) { C("${s}${other.s} +") }

    operator func -(other : C) { C("${s}${other.s} -") }

    operator func <<(other : C) { C("${s}${other.s} <<") }

    operator func >>(other : C) { C("${s}${other.s} >>") }

    operator func <(other : C) { C("${s}${other.s} <") }

    operator func <=(other : C) { C("${s}${other.s} <=") }

    operator func >(other : C) { C("${s}${other.s} >") }

    operator func >=(other : C) { C("${s}${other.s} >=") }

    operator func ==(other : C) { C("${s}${other.s} ==") }

    operator func !=(other : C) { C("${s}${other.s} !=") }

    operator func &(other : C) { C("${s}${other.s} &") }

    operator func ^(other : C) { C("${s}${other.s} ^") }

    operator func |(other : C) { C("${s}${other.s} |") }
}