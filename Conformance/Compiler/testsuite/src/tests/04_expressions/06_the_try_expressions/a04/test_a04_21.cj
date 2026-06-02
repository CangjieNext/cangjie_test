/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a04_21

  @Level:         1

  @Assertion: 4.6(4)
              The syntax of the try expression is defined as:

              tryExpression
                  : 'try' block 'finally' block
                  | 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
                  | 'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
                  ;

  @Description: Check that
                "'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?"
                without '(' in try part causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

var isResourceFree = true

class GlobalResource <: Resource {
    init() {
        isResourceFree = false
    }

    public func isClosed() {
        isResourceFree
    }

    public func close() {
        isResourceFree = true
    }
}

main() {
    try r = GlobalResource()) {
    } catch (e: Exception) {}
}

