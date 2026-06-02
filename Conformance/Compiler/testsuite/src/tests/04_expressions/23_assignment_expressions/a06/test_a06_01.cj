
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a06_01

  @Level:         1

  @Assertion:   4.23(6) An expression that appears to the left of a (compound) assignment operator is called a left
                value expression (i.e., leftValueExpression in the above definition).
  @Description: Sample test containing assignments with different left value expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

class C {
    var x = 0

    static var y = 0

    func f() { this }
}

main() {
    var x = 0
    x = 1
    var c = C()
    c = C()
    c.x = 1
    var a = [1, 2]
    a[1] = 1
    _ = ()
    var cq : ?C = C()
    cq?.x = 1
    c.f().x = 2
    C.y = 1
}
