/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct R3<X, Y> {
    public R3(
        x: Int64,
        y: X,
        v!: Int64 = 1,
        private var z!: Y
    ) {}
}

struct R4<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
    public var num1: T1
    private var num2: T2
    public var num3: T3
    public let num4: T4
    public var num5: T5
    public var num6: T6
    public var num7: T7
    public var num8: T8
    public var num9: T9
    public var num10: T10
    public init(num1!: T1, num2!: T2, num3!: T3, num4!: T4, num5!: T5, num6!: T6, num7!: T7, num8!: T8, num9!: T9,
        num10!: T10) {
        this.num1 = num1
        this.num2 = num2
        this.num3 = num3
        this.num4 = num4
        this.num5 = num5
        this.num6 = num6
        this.num7 = num7
        this.num8 = num8
        this.num9 = num9
        this.num10 = num10
    }
}

main() {
    var r10 = R3<Bool, String>(1, true, v: 2, z: "abcde")
    var r11 = R4<Int8, Int8, Int8, Int16, Int16, Int32, Int32, Int64, Int64, Unit>(num1: 1, num2: 2, num3: 3, num4: 4,
        num5: 5, num6: 6, num7: 7, num8: 8, num9: 9, num10: ())
    return 0
}
