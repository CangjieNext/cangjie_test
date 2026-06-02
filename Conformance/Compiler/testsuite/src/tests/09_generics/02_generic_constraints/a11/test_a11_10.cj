/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a11_10

  @Level:         1

  @Assertion: 9.2(11) The Syntax of generic constraints is as follows: 
              upperBounds
                  : type ('&' type)*
                  ;
              genericConstraints
                  : 'where' identifier '<:' upperBounds (',' identifier '<:' upperBounds)*
                  ;

  @Description:  Check that contraints not separated with "," cause a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

interface Printable {}

open class Animal {}

interface Drawable {}

open class Shape {}

func make_pair<T, U>(x: T, y: U) where
        T <: Animal & Printable
        U <: Shape & Drawable {
    return (x, y)
}

main() {}

