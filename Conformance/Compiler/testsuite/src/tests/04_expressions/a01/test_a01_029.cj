/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_029

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that an expression cannot consist of `super` expression
                without right operand.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @CompileWarning: Ignore
 
*/

open class C1 {
    open public func superVerify() {}
} 

open class C2 <: C1 {
    override public func superVerify() { 
        super.
        return
    }
}

main() { 
}
