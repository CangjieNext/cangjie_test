/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Definition of a class for negative tests

  @Structure: complex-aux
*/

package a14_neg

public open class A14Aux {
  public A14Aux(
    protected var prot_var_u: Int64,
    protected let prot_let_u: Int64,

    private var priv_var_u: Int64,
    private let priv_let_u: Int64,

    var var_u: Int64,
    let let_u: Int64,

    protected var prot_var_n!: Int64,
    protected let prot_let_n!: Int64,

    private var priv_var_n!: Int64,
    private let priv_let_n!: Int64,

    var var_n!: Int64,
    let let_n!: Int64
  ) {}
}
