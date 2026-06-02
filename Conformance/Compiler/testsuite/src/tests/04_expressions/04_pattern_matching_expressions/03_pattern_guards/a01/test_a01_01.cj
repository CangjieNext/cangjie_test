/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a01_01

  @Level:         1

  @Assertion:       4.4.3(1) To make further judgements on the matched values, Cangjie supports the use of pattern
                    guard.

  @Description:     Check that Cangjie supports pattern guard by compiling some pattern guard example.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

type User = (String, UInt8) // Name and age

func getUserInfo(): User { ("Chu Bong-Foo", 85) }

main() {
    var user = getUserInfo()
    let greetings = match(user) {
        case ("", _) => "Hello, noname!"
        case (name, age) where age < 15 => "Hiya, ${name} 🌞"
        case (name, age) where age < 23 => "Heeeeeere's ${name} 😎"
        case (name, age) => "Good day, Dear ${name}"
    }
    0
}
