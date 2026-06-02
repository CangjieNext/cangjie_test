/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_02_a02_01
  @Assertion:       macro matchOrThrow(expected: Tokens, actual: Tokens)

  @Description:     Positive cases for tuples: correct usages without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.macros.*

func getOne() { 1 }
func getPair() { (1, 1) }

main() {
    // Constant as actual value.
    @matchOrThrow[(0, 0)]( (0, 0) )
    @matchOrThrow[(_, 0)]( (0, 0) )
    @matchOrThrow[(0, _)]( (Int32(0), Int64(0)) )

    // Variable as actual value.
    let test = (0, 0)
    @matchOrThrow[(0, 0)](test)
    @matchOrThrow[(_, 0)](test)
    @matchOrThrow[(0, _)](test)

    // Function call as actual value.
    @matchOrThrow[(1, 1)](getPair())
    @matchOrThrow[(_, 1)](getPair())
    @matchOrThrow[(1, _)](getPair())

    // An expression as actual value.
    @matchOrThrow[(0, 0)](if (true) { (0, 0) } else { (1, 0) })
    @matchOrThrow[(_, 0)](match (true) {
                               case true => (0, 0)
                               case _ => (1, 0)
                           })
    @matchOrThrow[(1, _)]( (getOne(), 0) )
}
