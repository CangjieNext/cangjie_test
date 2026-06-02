/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           02_01_11_05_a11_01

  @Level:         1

  @Assertion:      2.1.11.5(11) For an expression e of type Option<T>, the unwrapping of e 
  is achieved by calling the function getOrThrow() or getOrThrow(exception: ()->Exception): 
 if the value of e equals to Option<T>.Some(v), then the value of e.getOrThrow() 
 (or e.getOrThrow(lambdaArg)) is equal to the value of v; 
 if the value of e is equal to Option<T>.None, then e.getOrThrow() throws a NoneValueException exception 
 at runtime (e.getOrThrow(lambdaArg) throws a exception specified in the lambdaArg).

 
  @Description:     Checks getOrThrow behavior on None and Some cases 

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

main() {
    Assert.equals(123, Some(123).getOrThrow())
    Assert.equals(53452, Some(53452).getOrThrow({=>Exception()}))
    Assert.throws({ => None<String>.getOrThrow() }, check: { e => e is NoneValueException})
    Assert.throws({ => None<Bool>.getOrThrow({ =>Exception() } ) }, check: { e => e is Exception})
}
