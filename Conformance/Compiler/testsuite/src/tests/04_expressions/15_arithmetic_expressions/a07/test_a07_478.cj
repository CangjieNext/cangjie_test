
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a07_478

  @Level:         1

  @Assertion:   4.15(7) For binary operators *, /, %, + and -, the types of operands supported by them are all numeric
                types, except %, which only supports integer types.
  @Description: Checks that using binary operator + with types Float64 and UInt8 is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

main() {
    var v1 : Float64 = 1.0
    var v2 : UInt8 = 1
    let v3 = v1 + v2
}

