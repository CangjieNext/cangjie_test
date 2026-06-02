/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a05_04

  @Level:         1

  @Assertion:    1.1(5) A raw identifier is got by adding a pair of backquotes
                 (i.e., `..`) outside of ordinary identifiers or keywords.

  @Description:  Check that keywords are allowed as raw identifiers.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
    var `as`: Int32 = 1
    var `break`: Int32 = 2
    var `Bool`: Int32 = 3
    var `case`: Int32 = 4
    var `catch`: Int32 = 5
    var `class`: Int32 = 6
    var `continue`: Int32 = 7
    var `Rune`: Int32 = 8
    var `do`: Int32 = 9
    var `else`: Int32 = 10
    var `enum`: Int32 = 11
    var `extend`: Int32 = 12
    var `false`: Int32 = 13
    var `finally`: Int32 = 14
    var `for`: Int32 = 15
    var `foreign`: Int32 = 16
    var `from`: Int32 = 17
    var `func`: Int32 = 18
    var `Float16`: Int32 = 19
    var `Float32`: Int32 = 20
    var `Float64`: Int32 = 21
    var `if`: Int32 = 22
    var `import`: Int32 = 23
    var `in`: Int32 = 24
    var `init`: Int32 = 25
    var `inout`: Int32 = 250
    var `interface`: Int32 = 26
    var `is`: Int32 = 27
    var `Int8`: Int32 = 28
    var `Int16`: Int32 = 29
    var `Int32`: Int32 = 30
    var `Int64`: Int32 = 31
    var `IntNative`: Int32 = 32
    var `let`: Int32 = 33
    var `macro`: Int32 = 34
    var `match`: Int32 = 35
    var `mut`: Int32 = 36
    var `main`: Int32 = 37
    var `Nothing`: Int32 = 38
    var `operator`: Int32 = 39
    var `package`: Int32 = 40
    var `prop`: Int32 = 41
    var `quote`: Int32 = 42
    var `return`: Int32 = 43
    var `spawn`: Int32 = 44
    var `struct`: Int32 = 45
    var `static`: Int32 = 46
    var `super`: Int32 = 47
    var `synchronized`: Int32 = 48
    var `this`: Int32 = 49
    var `throw`: Int32 = 50
    var `true`: Int32 = 51
    var `try`: Int32 = 52
    var `type`: Int32 = 53
    var `This`: Int32 = 54
    var `unsafe`: Int32 = 55
    var `UInt8`: Int32 = 56
    var `UInt16`: Int32 = 57
    var `UInt32`: Int32 = 58
    var `UInt64`: Int32 = 59
    var `UIntNative`: Int32 = 60
    var `Unit`: Int32 = 61
    var `var`: Int32 = 62
    var `where`: Int32 = 63
    var `while`: Int32 = 64

    let `abstract` = 0
    let `get` = 0
    let `open` = 0
    let `override` = 0
    let `private` = 0
    let `protected` = 0
    let `public` = 0
    let `redef` = 0
    let `sealed` = 0
    let `set` = 0
}
