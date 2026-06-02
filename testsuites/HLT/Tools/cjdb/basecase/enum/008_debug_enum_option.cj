/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum Option<T> {
      Some(T)
    | None
}

enum TimeUnit1 {
    Year | Month | Day | Hour
}

main() {

    let opInt32_1 = Option<Int32>.Some(100)             // The type of 'opInt32_1' is 'Option<Int32>'
    let opInt32_2 = Option<Int32>.None                  // The type of 'opInt32_2' is 'Option<Int32>'
    let opChar = Option<Rune>.Some('m')                 // The type of 'opChar' is 'Option<Rune>'
    let opBool = Option<Bool>.None                      // The type of 'opBool' is 'Option<Bool>'
    let opEnum = Option<TimeUnit1>.Some(TimeUnit1.Year) // The type of 'opEnum' is 'Option<TimeUnit1>'

    let number1: Int32 = match (opInt32_1) {
        case Some(num) => num // matched
        case None => 0
    }

    let number2: Int32 = match (opInt32_2) {
        case Some(num) => num
        case None => 0        // matched
    }

    let enumValue: String = match (opEnum) {
        case Some(tu) => match (tu) {
            case Year => "Year"   // matched
            case Month => "Month"
            case Day => "Day"
            case Hour => "Hour"
        }
        case None => "None"
    }


    return 0
}






