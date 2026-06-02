/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_a05_01

  @Level:         1

  @Assertion:    10.1.3(5)If no unique closest matching function exists,
                 a compilation error is reported
  
  @Description:  Scopes in enclosed routines. Check ability to solve overloading
                 via type alias

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

type MyInt8 = Int8
type MyInt16 = Int16
type MyInt32 = Int32
func SCheck(arg:Int64) {    
    func SCheck(arg:Int8) {
    }
    func SCheck(arg:Int16) {
    }
    func SCheck(arg:Int32) {
    }
    func SCheck(arg:MyInt8,b!: Bool = false) {
    }
    let i8 = Int8(arg & 0xff)
    let i16 = Int16(arg & 0xffff)
    let i32 = Int32(arg & 0xffffffff)
    SCheck(i8) 
    SCheck(i16) 
    SCheck(i32) 
}


main(ina :Array<String>) {
    SCheck(0x6111111160006B0Ai64)
    0
}

