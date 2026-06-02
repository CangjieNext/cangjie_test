/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_06_a01_01

  @Level:         1
  @Assertion:   A.1.6(1)
                identifier
                    : Identifier
                    | PUBLIC
                    | PRIVATE
                    | PROTECTED
                    | OVERRIDE
                    | ABSTRACT
                    | OPEN
                    | REDEF
                    | GET
                    | SET
                    ;
                Identifier
                    : Letter (Letter | '_' | DecimalDigit)*
                    | '`' Letter (Letter | '_' | DecimalDigit)* '`'
                    ;
                Letter
                    : [a-zA-Z]
                    ;

  @Description: Check various identifiers
  @Comment:     Auto-generated tests by gen_identifiers_tests_a01.py with seed = 1
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
  
    // Check h76g06_S symbol as identifier 
    var h76g06_S = 1

    // Check `ZLubP_y_` symbol as identifier 
    var `ZLubP_y_` = 1

    // Check `b_W7_wRW` symbol as identifier 
    var `b_W7_wRW` = 1

    // Check `A__l__1_` symbol as identifier 
    var `A__l__1_` = 1

    // Check `Qt989EV6` symbol as identifier 
    var `Qt989EV6` = 1

    // Check `S__18XH5` symbol as identifier 
    var `S__18XH5` = 1

    // Check c9__2GaI symbol as identifier 
    var c9__2GaI = 1

    // Check `w_78__y_` symbol as identifier 
    var `w_78__y_` = 1

    // Check d5__G760 symbol as identifier 
    var d5__G760 = 1

    // Check `bOJ_f_0_` symbol as identifier 
    var `bOJ_f_0_` = 1

    // Check CW31_w1k symbol as identifier 
    var CW31_w1k = 1

    // Check r__7_71t symbol as identifier 
    var r__7_71t = 1

    // Check `Yqq__M0b` symbol as identifier 
    var `Yqq__M0b` = 1

    // Check UC___8O_ symbol as identifier 
    var UC___8O_ = 1

    // Check Pz__6V2d symbol as identifier 
    var Pz__6V2d = 1

    // Check t292JLK2 symbol as identifier 
    var t292JLK2 = 1

    // Check `wn__9FQ4` symbol as identifier 
    var `wn__9FQ4` = 1

    // Check N4ku_v31 symbol as identifier 
    var N4ku_v31 = 1

    // Check `I8e_fkIr` symbol as identifier 
    var `I8e_fkIr` = 1

    // Check `v13__2__` symbol as identifier 
    var `v13__2__` = 1

    // Check public symbol as identifier 
    // var public = 1

    // Check private symbol as identifier 
    // var private = 1

    // Check protected symbol as identifier 
    // var protected = 1

    // Check override symbol as identifier 
    // var override = 1

    // Check abstract symbol as identifier 
    // var abstract = 1

    // Check open symbol as identifier 
    // var open = 1

    // Check redef symbol as identifier 
    // var redef = 1

    // Check get symbol as identifier 
    // var get = 1

    // Check set symbol as identifier 
    // var set = 1

    // Check `Int8` symbol as identifier 
    var `Int8` = 1

    // Check `Int16` symbol as identifier 
    var `Int16` = 1

    // Check `Int32` symbol as identifier 
    var `Int32` = 1

    // Check `Int64` symbol as identifier 
    var `Int64` = 1

    // Check `IntNative` symbol as identifier 
    var `IntNative` = 1

    // Check `UInt8` symbol as identifier 
    var `UInt8` = 1

    // Check `UInt16` symbol as identifier 
    var `UInt16` = 1

    // Check `UInt32` symbol as identifier 
    var `UInt32` = 1

    // Check `UInt64` symbol as identifier 
    var `UInt64` = 1

    // Check `UIntNative` symbol as identifier 
    var `UIntNative` = 1

    // Check `Float16` symbol as identifier 
    var `Float16` = 1

    // Check `Float32` symbol as identifier 
    var `Float32` = 1

    // Check `Float64` symbol as identifier 
    var `Float64` = 1

    // Check `Rune` symbol as identifier 
    var `Rune` = 1

    // Check `Bool` symbol as identifier 
    var `Bool` = 1

    // Check `Unit` symbol as identifier 
    var `Unit` = 1

    // Check `Nothing` symbol as identifier 
    var `Nothing` = 1

    // Check `struct` symbol as identifier 
    var `struct` = 1

    // Check `enum` symbol as identifier 
    var `enum` = 1

    // Check `This` symbol as identifier 
    var `This` = 1

    // Check `package` symbol as identifier 
    var `package` = 1

    // Check `import` symbol as identifier 
    var `import` = 1

    // Check `class` symbol as identifier 
    var `class` = 1

    // Check `interface` symbol as identifier 
    var `interface` = 1

    // Check `func` symbol as identifier 
    var `func` = 1

    // Check `main` symbol as identifier 
    var `main` = 1

    // Check `let` symbol as identifier 
    var `let` = 1

    // Check `var` symbol as identifier 
    var `var` = 1

    // Check `type` symbol as identifier 
    var `type` = 1

    // Check `init` symbol as identifier 
    var `init` = 1

    // Check `this` symbol as identifier 
    var `this` = 1

    // Check `super` symbol as identifier 
    var `super` = 1

    // Check `if` symbol as identifier 
    var `if` = 1

    // Check `else` symbol as identifier 
    var `else` = 1

    // Check `case` symbol as identifier 
    var `case` = 1

    // Check `try` symbol as identifier 
    var `try` = 1

    // Check `catch` symbol as identifier 
    var `catch` = 1

    // Check `finally` symbol as identifier 
    var `finally` = 1

    // Check `for` symbol as identifier 
    var `for` = 1

    // Check `do` symbol as identifier 
    var `do` = 1

    // Check `while` symbol as identifier 
    var `while` = 1

    // Check `throw` symbol as identifier 
    var `throw` = 1

    // Check `return` symbol as identifier 
    var `return` = 1

    // Check `continue` symbol as identifier 
    var `continue` = 1

    // Check `break` symbol as identifier 
    var `break` = 1

    // Check `is` symbol as identifier 
    var `is` = 1

    // Check `as` symbol as identifier 
    var `as` = 1

    // Check `in` symbol as identifier 
    var `in` = 1

    // Check `match` symbol as identifier 
    var `match` = 1

    // Check `from` symbol as identifier 
    var `from` = 1

    // Check `where` symbol as identifier 
    var `where` = 1

    // Check `extend` symbol as identifier 
    var `extend` = 1

    // Check `spawn` symbol as identifier 
    var `spawn` = 1

    // Check `synchronized` symbol as identifier 
    var `synchronized` = 1

    // Check `macro` symbol as identifier 
    var `macro` = 1

    // Check `quote` symbol as identifier 
    var `quote` = 1

    // Check `true` symbol as identifier 
    var `true` = 1

    // Check `false` symbol as identifier 
    var `false` = 1

    // Check `static` symbol as identifier 
    var `static` = 1

    // Check `public` symbol as identifier 
    var `public` = 1

    // Check `private` symbol as identifier 
    var `private` = 1

    // Check `protected` symbol as identifier 
    var `protected` = 1

    // Check `override` symbol as identifier 
    var `override` = 1

    // Check `redef` symbol as identifier 
    var `redef` = 1

    // Check `abstract` symbol as identifier 
    var `abstract` = 1

    // Check `open` symbol as identifier 
    var `open` = 1

    // Check `operator` symbol as identifier 
    var `operator` = 1

    // Check `foreign` symbol as identifier 
    var `foreign` = 1

    // Check `inout` symbol as identifier 
    var `inout` = 1

    // Check `prop` symbol as identifier 
    var `prop` = 1

    // Check `mut` symbol as identifier 
    var `mut` = 1

    // Check `unsafe` symbol as identifier 
    var `unsafe` = 1

    // Check `get` symbol as identifier 
    var `get` = 1

    // Check `set` symbol as identifier 
    var `set` = 1

  return 0
}
