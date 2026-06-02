// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import module_name.{package1.a1 as alias1, package2.a2 as alias2}

main(): Int64 {
    var a = alias1
    var b = alias2
    return a-b
}