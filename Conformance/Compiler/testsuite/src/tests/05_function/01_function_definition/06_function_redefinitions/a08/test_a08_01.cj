/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a08_01

  @Level:         1

  @Assertion:       5.1.6(8) 3.The following two functions constitute redefinitions because there exists a renaming 
                    [X |-> Y, Y |-> X] such that the non-generic parts of the two functions constitute redefinitions.
                    func f<X,Y>(a:X, b:Y) {}
                    func f<Y,X>(a:Y, b:X) {}

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func f<X,Y>(a:X, b:Y) {}
func f<Y,X>(a:Y, b:X) {}

main() {
}
