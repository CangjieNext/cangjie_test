/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Data {
    public var a: Int8 = 128
    public var b: Float64 = 1.8976_9313_486231570E308
    public init(x: Int32) {
        this.a = Int8(this.b)
    }
}

struct Foo {
    public var a: Int16 = -32769
    public var b: Float32 = 1.8976_9313_486231570E39
    public init(a: Float64) {
        b = Float32(a)
    }
}

main() {
    Foo(4.5)
    Data(1232)
    ()
}
// ASSERT: scan sema_exceed_num_value_range
// ASSERT: scan sema_float_literal_too_large
