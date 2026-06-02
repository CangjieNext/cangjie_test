/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_02_a04_02

  @Level:         1

  @Assertion: 9.5.2(4) Means that if there is a static function in the interface that is a generic constraint, it is 
              not possible to instantiate an interface or abstract class that does not implement the corresponding 
              static function as a type of generic variant.

  @Description: Check that interface instantiation with unimplemented static function causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface Printable {
    // Unimplemented interface static function.
    static func initPrinter(): Bool
}

func id<T>(x: T) where T <: Printable {
    return x
}

main() {
    id<Printable>(Printable())
    return
}

