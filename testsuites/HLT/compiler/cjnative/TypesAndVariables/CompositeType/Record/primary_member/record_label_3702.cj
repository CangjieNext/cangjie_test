/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run()
}

func run(): Int64 {
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2: () -> Int32 = {
        =>
        var res: Int32 = 0;
        return res
    }
    var date: Date = Date()
    var day: Day = Day()
    var time: Time = Time()
    var time2: Time2 = Time2()
    var time3: Time3 = Time3()
    return 0
}

struct Date {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter2: () -> Int32 = {
        =>
        var res: Int32 = 0;
        return res
    } // coredumped :Cangjie::GenerateModule
    public init() {}
}

struct Day {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter2: () -> Int32 = {
        =>
        var res: Int32 = 0;
        res
    } // 报错：[Error] :0:0: type of default argument value is not match to expected type '() -> Int32'
    public init() {}
}

struct Time {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter2: () -> Int32 = {=> width}
    public init() {}
}

struct Time2 {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter2: () -> Int32 = {=> 4} // 报错： [Error] :0:0: type of default argument value is not match to expected type '() -> Int32'
    public init() {}
}

struct Time3 {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter2: () -> Int64 = {=> 4} // coredump：Cangjie::GenerateModule
    public init() {}
}
// ASSERT: scan sema_illegal_usage_of_member
