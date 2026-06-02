/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_02_a03_01
  @Assertion:       macro matchOrThrow(expected: Tokens, actual: Tokens)

  @Description:     Positive cases for nested types: correct usages without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.macros.*

enum EnumWithTuple { A | B( (Int64, Int64) ) }
enum EnumWithEnum { C | D(EnumWithEnum) }

main() {
    // Enum with tuple.
    @matchOrThrow[B( (0, 0) )](B( (0, 0) ))
    @matchOrThrow[B( (_, 0) )](B( (0, 0) ))
    @matchOrThrow[B( (0, _) )](B( (0, 0) ))

    // Enum with enum.
    @matchOrThrow[C](C)
    @matchOrThrow[D(C)](D(C))
    @matchOrThrow[D(_)](D(D(C)))

    // Tuple with enum.
    @matchOrThrow[(0, A)]( (0, A) )
    @matchOrThrow[(0, B( (0, 0) ))]( (0, B( (0, 0) )) )
    @matchOrThrow[(_, B( (_, 0) ))]( (0, B( (0, 0) )) )
    @matchOrThrow[(0, _)]( (0, A) )

    // Tuple with tuple.
    @matchOrThrow[(0, (0, 0))]( (0, (0, 0)) )
    @matchOrThrow[(_, (_, 0))]( (0, (0, 0)) )
    @matchOrThrow[(0, (_, 0))]( (0, (0, 0)) )
}
