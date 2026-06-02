/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a04_01

  @Level:         1

  @Assertion: 4.4.1.1(4) The syntax of constant patterns is as follows.
              constantPattern
                  : literalConstant
                  ;

  @Description: Validates compilation of some examples illustrating the syntax definition above.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

var v1 = 1
var v2 = ""
var v3 = 'a'
var v4 = b'\u{A}'
var v5 = 0.1

main() {
    var m = match (v1) {
        case 1 => 1
        case _ => 0
    }

    m = match (v2) {
        case "" => 1
        case _ => 0
    }

    m = match (v3) {
        case 'a' => 1
        case _ => 0
    }

    m = match (v4) {
        case b'\u{B}' => 2
        case b'\u{A}' => 1
        case _ => 0
    }

    m = match (v5) {
        case 0.1 => 1
        case 0.2 => 1
        case _ => 0
    }

    return
}
