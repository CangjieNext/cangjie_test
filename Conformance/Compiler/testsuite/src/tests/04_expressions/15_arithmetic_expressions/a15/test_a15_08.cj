
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a15_08

  @Level:         1

  @Assertion:   4.15(15) 2. When the type of the left operand is Float64, the type of the right operand can only be
                Int64 or Float64, and the expression is of type Float64.
  @Description: Checks that using binary operator ** with types Float64 and UInt64 is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

main() {
    let v1 : Float64 = 1.0
    let v2 : UInt64 = 1
    let v3 = v1 ** v2
}

