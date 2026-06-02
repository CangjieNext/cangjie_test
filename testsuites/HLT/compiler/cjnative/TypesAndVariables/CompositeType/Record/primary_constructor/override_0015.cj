/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

struct Data<D, C> {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public Data(a: C, b: Int32, c!: Int32 = 0) {
        this.a = a
        this.b = a
    }

    public init(a: C, b: Int32, c!: Bool = false) {
    }
}

func run(): Int64 {
    var a: Int32 = 8
    let b: Bool = false
    return Int64(Data<Int32, Int32>(a, a).a - 8)
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_ambiguous_constructor_match
