/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_a02_01
  @Assertion:       macro notMatchOrThrow(unexpected: Tokens, actual: Tokens)

  @Description:     Positive cases for tuples: correct usages without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

  @Issue:           0006076
*/

import utils.macros.*

func getOne() { 1 }
func getPair() { (1, 1) }

main() {
    // Constant as actual value.
    @notMatchOrThrow[(0, 0)]( (0, 1) )
    @notMatchOrThrow[(0, 0)]( (Int32(1), 0) )
    @notMatchOrThrow[(0, 0)]( (1, Int32(1)) )

    @notMatchOrThrow[(_, 0)]( (0, 1) )
    @notMatchOrThrow[(0, _)]( (Int32(1), Int64(0)) )

    // Variable as actual value.
    let test = (1, 1)
    @notMatchOrThrow[(1, 0)](test)
    @notMatchOrThrow[(0, 1)](test)
    @notMatchOrThrow[(0, 0)](test)
    @notMatchOrThrow[(_, 0)](test)
    @notMatchOrThrow[(0, _)](test)

    // Function call as actual value.
    @notMatchOrThrow[(1, 0)](getPair())
    @notMatchOrThrow[(0, 1)](getPair())
    @notMatchOrThrow[(0, 0)](getPair())
    @notMatchOrThrow[(_, 0)](getPair())
    @notMatchOrThrow[(0, _)](getPair())

    // An expression as actual value.
    @notMatchOrThrow[(0, 0)](if (true) { (0, 1) } else { (1, 0) })
    @notMatchOrThrow[(0, 0)](if (false) { (0, 1) } else { (1, 0) })
    @notMatchOrThrow[(_, 0)](match (true) {
                               case true => (0, 1)
                               case _ => (1, 0)
                           })
    @notMatchOrThrow[(0, _)](match (false) {
                               case true => (0, 1)
                               case _ => (1, 0)
                           })
    @notMatchOrThrow[(_, 0)]( (getOne(), getOne()) )
    @notMatchOrThrow[(0, _)]( (getOne(), getOne()) )
}
