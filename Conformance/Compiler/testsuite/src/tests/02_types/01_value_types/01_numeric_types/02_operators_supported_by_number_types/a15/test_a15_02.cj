/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a15_02

  @Level:         1
  @Assertion:       2.1.1.2(15) Unary minus operator is denoted as -. The unary minus operator returns the negation of
                    its operand. For details about the unary minus operator, see Chapter 4.

  @Description:     Check that the unary minus can be used with unsigned numbers greater than zero.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

func getU8(): UInt8 { 11 }
func getU16(): UInt16 { 13 }
func getU32(): UInt32 { 32 }
func getU64(): UInt64 { 98 }
func getUnative(): UIntNative { 3 }

main() {
    -getU8()
    -getU16()
    -getU32()
    -getU64()
    -getUnative()
}
