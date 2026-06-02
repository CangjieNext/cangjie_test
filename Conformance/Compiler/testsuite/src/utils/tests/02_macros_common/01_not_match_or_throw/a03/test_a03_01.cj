/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_a03_01
  @Assertion:       macro notMatchOrThrow(unexpected: Tokens, actual: Tokens)

  @Description:     Positive cases for nested types: correct usages without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

  @Issue:           0006076
*/

import utils.macros.*

enum EnumWithTuple { A | B( (Int64, Int64) ) }
enum EnumWithEnum { C | D(EnumWithEnum) }

main() {
    // Enum with tuple.
    @notMatchOrThrow[B( (0, 0) )](B( (0, 1) ))
    @notMatchOrThrow[B( (0, 0) )](B( (1, 0) ))
    @notMatchOrThrow[B( (_, 0) )](B( (0, 1) ))
    @notMatchOrThrow[B( (0, _) )](B( (1, 0) ))
    @notMatchOrThrow[B( (_, _) )](A)

    // Enum with enum.
    @notMatchOrThrow[D(C)](D(D(C)))
    @notMatchOrThrow[D(D(C))](D(C))
    @notMatchOrThrow[D(_)](C)

    // Tuple with enum.
    @notMatchOrThrow[(0, A)]( (0, B( (0, 0) )) )
    @notMatchOrThrow[(0, A)]( (1, A) )
    @notMatchOrThrow[(0, B( (0, 0) ))]( (0, A) )
    @notMatchOrThrow[(0, B( (0, 0) ))]( (0, B( (0, 1) )) )
    @notMatchOrThrow[(_, B( (_, 0) ))]( (0, B( (0, 1) )) )
    @notMatchOrThrow[(0, _)]( (1, A) )

    // Tuple with tuple.
    @notMatchOrThrow[(0, (0, 0))]( (0, (0, 1)) )
    @notMatchOrThrow[(0, (0, 0))]( (1, (0, 0)) )
    @notMatchOrThrow[(_, (_, 0))]( (0, (0, 1)) )
    @notMatchOrThrow[(0, (_, 0))]( (0, (0, 1)) )
}
