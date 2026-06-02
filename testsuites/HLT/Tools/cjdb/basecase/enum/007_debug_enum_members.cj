/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day

    public func printValue(): Unit {
        let res = match (this) {
            case Year(x) => "Year(${x})"
            case Month(x) => "Month(${x})"
            case Day => "Day"
        }
        print("the value is ${res}\n")
    }

}

main() {
    var time = Year(3)

    return 0
}






