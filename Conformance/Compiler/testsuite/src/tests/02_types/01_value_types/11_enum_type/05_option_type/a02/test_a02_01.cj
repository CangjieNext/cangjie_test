/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a02_01

  @Level:         1

  @Assertion:       2.1.11.5(2) Some and None are two different constructors, where Some(T) represents a state 
  with values and None represents a no-value state. Specific option types can be defined by generic instantiation, 
  such as Option<Int32>, Option<String> etc.

  @Description:     Checks that the specified constructors can be used w/ and w/o type prefix 
  and generic parameters specification.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/

let a = None<Unit>
let b = Option<ToString>.None

var c = Some(1.2)

main() {
    var e: Option<(Rune)>
    e = Option.Some((r'q'))
    let d = e is Option<(Rune)>
}
