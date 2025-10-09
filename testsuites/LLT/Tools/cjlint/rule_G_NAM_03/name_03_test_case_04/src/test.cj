// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 不符合：类名使用小驼峰
class marcoPolos {

}

// 不符合：枚举类型名和成员使用了小驼峰
enum timeUnit {
    Year | Month | day | Hour

    func dd(){}
}

class WrongEx <: Exception {

}

class RightException <: Exception {

}

class WrongErr <: Error {

}

class RightError <: Error {

}