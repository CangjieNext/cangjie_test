/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a07_01

  @Level:         1

  @Assertion:       5.1.6(7) 2.The following two functions do not constitute redefinitions because there does notexist
                    any renaming such that the non-generic parts of the two functions constitute redefinitions.
                    func f<X,Y>(a:X,b:Y){}
                    func f<Y,X>(a:X,b:Y){}

  @Description:     Positive example from spec.

  @Mode:            compileonly

  @Negative:        no

  @Structure:       single

*/

func f<X,Y>(a:X,b:Y){}
func f<Y,X>(a:X,b:Y){}

main() {
}
