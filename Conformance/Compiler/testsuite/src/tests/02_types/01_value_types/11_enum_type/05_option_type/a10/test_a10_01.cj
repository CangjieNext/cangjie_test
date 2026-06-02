/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a10_01

  @Level:         1

  @Assertion:       2.1.11.5(10) 
 let number1 = match (opInt32_1) {
  case Some(num) => num // matched
  case None => 0\
 }

 let number2 = match (opInt32_2) {
  case Some(num) => num
  case None => 0 // matched
 }

 let enumValue = match (opEnum) {
  case Some(tu) => match (tu) {
     case Year => "Year" // matched
     case Month => "Month"
     case Day => "Day"
     case Hour => "Hour"
    }
  case None => "None"
 }
 
  @Description:     Checks that positive examples behave as expected

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning: Ignore

  @Comment:

*/
import utils.assert.Assert

enum TimeUnit1 {
    Year | Month | Day | Hour
}

let opInt32_1 = Some(100i32) // The type of 'opInt32_1' is 'Option<Int32>'
let opInt32_2 = Option<Int32>.None // The type of 'opInt32_2' is 'Option<Int32>'
let opChar = Some('m') // The type of 'opChar' is 'Option<Rune>'
let opBool = Option<Bool>.None // The type of 'opBool' is 'Option<Bool>'
let opEnum = Some(TimeUnit1.Year) // The type of 'opEnum' is 'Option<TimeUnit1>'

main() {
let number1 = match (opInt32_1) {
    case Some(num) => num // matched
    case None => 0i32
}
Assert.equals(100i32, number1)

let number2 = match (opInt32_2) {
    case Some(num) => num
    case None => 0i32 // matched
}
Assert.equals(0i32, number2)

let enumValue = match (opEnum) {
    case Some(tu) => match (tu) {
        case Year => "Year" // matched
        case Month => "Month"
        case Day => "Day"
        case Hour => "Hour"
        }
    case None => "None"
}
Assert.equals("Year", enumValue)
}
