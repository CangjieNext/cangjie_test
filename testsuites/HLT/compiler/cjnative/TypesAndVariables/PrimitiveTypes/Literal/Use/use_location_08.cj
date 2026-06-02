/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// 点号，函数入参默认值
extend Int64 {
    func a(a!: Int64 = 1i64) {
        this + a
    }
}

extend Int32 {
    func a(a!: Int32 = 1i32) {
        this + a
    }
}

extend Int16 {
    func a(a!: Int16 = 1i16) {
        this + a
    }
}

extend Int8 {
    func a(a!: Int8 = 1i8) {
        this + a
    }
}

extend UInt64 {
    func a(a!: UInt64 = 1u64) {
        this + a
    }
}

extend UInt32 {
    func a(a!: UInt32 = 1u32) {
        this + a
    }
}

extend UInt16 {
    func a(a!: UInt16 = 1u16) {
        this + a
    }
}

extend UInt8 {
    func a(a!: UInt8 = 1u8) {
        this + a
    }
}

extend Float64 {
    func a(a!: Float64 = 1.0f64) {
        this + a
    }
}

extend Float32 {
    func a(a!: Float32 = 1.0f32) {
        this + a
    }
}

extend Float16 {
    func a(a!: Float16 = 1.0f16) {
        this + a
    }
}

extend<T> Array<T> {
    func a(a!: Array<UInt8> = "\u{1}".toArray()) {
        a[0]
    }
}

main(): Int64 {
    if (0i64.a() != 1) {
        return 1
    }
    if (0i32.a() != 1) {
        return 2
    }
    if (0i16.a() != 1) {
        return 3
    }
    if (0i8.a() != 1) {
        return 4
    }
    if (0u64.a() != 1) {
        return 5
    }
    if (0u32.a() != 1) {
        return 6
    }
    if (0u16.a() != 1) {
        return 7
    }
    if (0u8.a() != 1) {
        return 8
    }
    if (0.0f64.a() != 1.0) {
        return 9
    }
    if (0.0f32.a() != 1.0) {
        return 10
    }
    if (0.0f16.a() != 1.0) {
        return 11
    }
    if (UInt8(UInt32(r'\u{0}')).a() != 1) {
        return 12
    }
    if ("\u{0}".toArray().a() != 1) {
        return 13
    }
    return 0
}
