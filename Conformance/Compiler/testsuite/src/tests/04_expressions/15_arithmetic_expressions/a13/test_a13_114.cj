
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a13_114

  @Level:         1

  @Assertion:   4.15(13) The left operand of ** can only be of type Int64 or Float64.
  @Description: Checks that using binary operator ** with types Float64 and Int64 is permitted.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

main() {
    let v1 : Float64 = 1.0
    let v2 : Int64 = 1
    let v3 = v1 ** v2
}

