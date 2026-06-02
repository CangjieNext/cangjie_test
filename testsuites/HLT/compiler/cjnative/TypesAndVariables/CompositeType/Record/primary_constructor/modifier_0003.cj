/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct Data {
    public var b: Int32
    protected Data() {
        this.b = 3
    }
}

struct Data2 <: Data {}

func run(): Int32 {
    var data: Data = Data()

    return data.b - 3
}

main(): Int64 {
    return Int64(run())
}
// ASSERT: scan sema_type_implement_non_interface
