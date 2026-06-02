/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Data {
    public var a: Int32
    public init() {
        if (true) {
            a = 1
        }
    }
}

func getBool(x: Int32): Bool {
    if (x > 1) {
        return true
    } else {
        return false
    }
}

class Data2 {
    public var a: Int32
    public init() {
        if (getBool(2)) {
            a = 1
        }
    }
}

main(): Int64 {
    var data1 = Data()
    var data2 = Data2()
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
