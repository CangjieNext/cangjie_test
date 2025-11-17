/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum Result<T> {
      Success(T)
    | Failure(Exception)

}

enum TimeUnit1 {
    Year | Month | Day | Hour
}

main() {

    let rInt32_1 = Result<Int32>.Success(100)    // The type of 'rInt32_1' is 'Result<Int32>'
    let rInt32_2 = Result<Int32>.Failure(Exception())   // The type of 'rInt32_2' is 'Result<Int32>'
    let rChar = Result<Rune>.Success(r'm')               // The type of 'rChar' is 'Result<Rune>'
    let rBool = Result<Bool>.Failure(Exception())       // The type of 'rBool' is 'Result<Bool>'
    let number1: Int32 = match (rInt32_1) {
        case Success(num) => num // matched
        case Failure(_) => 0
    }

    let number2: Int32 = match (rInt32_2) {
        case Success(num) => num
        case Failure(_) => 0 // matched
    }

    return 0
}
