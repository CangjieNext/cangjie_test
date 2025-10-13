open class C1 {
    static func f1(): Int64 { 1 }
    static func f2(): Int64 { 2 }
}
class C2 <: C1 {
          static func f1(): Int64 { 3 }
}
main(): Int64 {
    return C2.f1() + C2.f2()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
