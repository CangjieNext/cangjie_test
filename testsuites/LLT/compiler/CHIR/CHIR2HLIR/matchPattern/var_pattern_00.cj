// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f %diag_json -o %output 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'x'

func matchValue(value: (String, UInt8)) {
    let str = match (value) {
        case ("李四", age) => "李四的年龄：${age}"
        case ("张三", age) => "张三的年龄：${age}"
        case (name, 30) => "${name}的年龄：30"
        case (x, x) => "${x}的年龄：${x}" // EXPECTED: regex-not has been defined in the outside of match expression
    }
    println(str)
}

main() {
    matchValue(("张三", 18))
    0
}
