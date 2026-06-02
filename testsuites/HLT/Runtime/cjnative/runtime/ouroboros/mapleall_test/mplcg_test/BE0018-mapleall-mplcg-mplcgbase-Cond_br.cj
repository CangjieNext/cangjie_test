/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 125134134124712461256024602460257025613461347134613561245124512451255124513451356134503450355034503450345134612560346

func test(i1: Int32, i2: Int32): Int32 {
    if (i1 > i2) {
        return 0
    } else {
        return 1
    }
}

func test2(i1: Int32, i2: Int32): Int32 {
    if (i1 == i2) {
        return 2
    } else {
        return 3
    }
}

func test3(i1: Int32, i2: Int32): Int32 {
    if (i1 != 0x0) {
        return 4
    } else {
        return 5
    }
}

func test(i: Int64, j: Int64, k: Int64): Int32 {
    if (i < j) {
        return 0
    } else {
        return 1
    }
}

func test2(i: Int64, j: Int64, k: Int64): Int32 {
    if (i <= j) {
        return 2
    } else {
        return 3
    }
}

func test3(i: Int64, j: Int64, k: Int64): Int32 {
    if (i >= k) {
        return 4
    } else {
        return 5
    }
}

func test4(i: Int64, j: Int64, k: Int64): Int32 {
    if (j != k) {
        return 6
    } else {
        return 7
    }
}

func test(d1: Float64, d2: Float64): Int32 {
    if (d1 > d2) {
        return 0
    } else {
        return 1
    }
}

func test2(d1: Float64, d2: Float64): Int32 {
    if (d1 == d2) {
        return 2
    } else {
        return 3
    }
}

func test3(d1: Float64, d2: Float64): Int32 {
    if (d1 != d2) {
        return 4
    } else {
        return 5
    }
}

func test4(d1: Float64, d2: Float64): Int32 {
    if (d1 != 0.0) {
        return 6
    } else {
        return 7
    }
}

func test(f1: Float32, f2: Float32, f3: Float32) {
    if (f1 < f2) {
        return 0
    } else {
        return 1
    }
}

func test2(f1: Float32, f2: Float32, f3: Float32) {
    if (f1 > f2) {
        return 2
    } else {
        return 3
    }
}

func test3(f1: Float32, f2: Float32, f3: Float32) {
    if (f2 != f3) {
        return 4
    } else {
        return 5
    }
}

func test4(f1: Float32, f2: Float32, f3: Float32) {
    if (f3 != 0.0) {
        return 5
    } else {
        return 6
    }
}

main(): Int64 {
    print(test(Int32(0), Int32(0)).toString())
    print(test2(Int32(0), Int32(0)).toString())
    print(test3(Int32(0), Int32(0)).toString())
    print(test(Int32(7), Int32(8)).toString())
    print(test2(Int32(7), Int32(8)).toString())
    print(test3(Int32(7), Int32(8)).toString())
    print(test(Int32(-3), Int32(-1)).toString())
    print(test2(Int32(-3), Int32(-1)).toString())
    print(test3(Int32(-3), Int32(-1)).toString())

    print(test(Int64(0), Int64(0), Int64(0)).toString())
    print(test2(Int64(0), Int64(0), Int64(0)).toString())
    print(test3(Int64(0), Int64(0), Int64(0)).toString())
    print(test4(Int64(0), Int64(0), Int64(0)).toString())
    print(test(Int64(0), Int64(0), Int64(-1)).toString())
    print(test2(Int64(0), Int64(0), Int64(-1)).toString())
    print(test3(Int64(0), Int64(0), Int64(-1)).toString())
    print(test4(Int64(0), Int64(0), Int64(-1)).toString())
    print(test(Int64(0), Int64(0), Int64(7)).toString())
    print(test2(Int64(0), Int64(0), Int64(7)).toString())
    print(test3(Int64(0), Int64(0), Int64(7)).toString())
    print(test4(Int64(0), Int64(0), Int64(7)).toString())
    print(test(Int64(1), Int64(2), Int64(0)).toString())
    print(test2(Int64(1), Int64(2), Int64(0)).toString())
    print(test3(Int64(1), Int64(2), Int64(0)).toString())
    print(test4(Int64(1), Int64(2), Int64(0)).toString())
    print(test(Int64(1), Int64(2), Int64(1)).toString())
    print(test2(Int64(1), Int64(2), Int64(1)).toString())
    print(test3(Int64(1), Int64(2), Int64(1)).toString())
    print(test4(Int64(1), Int64(2), Int64(1)).toString())
    print(test(Int64(1), Int64(2), Int64(2)).toString())
    print(test2(Int64(1), Int64(2), Int64(2)).toString())
    print(test3(Int64(1), Int64(2), Int64(2)).toString())
    print(test4(Int64(1), Int64(2), Int64(2)).toString())
    print(test(Int64(1), Int64(2), Int64(3)).toString())
    print(test2(Int64(1), Int64(2), Int64(3)).toString())
    print(test3(Int64(1), Int64(2), Int64(3)).toString())
    print(test4(Int64(1), Int64(2), Int64(3)).toString())
    print(test(Int64(2), Int64(1), Int64(0)).toString())
    print(test2(Int64(2), Int64(1), Int64(0)).toString())
    print(test3(Int64(2), Int64(1), Int64(0)).toString())
    print(test4(Int64(2), Int64(1), Int64(0)).toString())
    print(test(Int64(2), Int64(1), Int64(1)).toString())
    print(test2(Int64(2), Int64(1), Int64(1)).toString())
    print(test3(Int64(2), Int64(1), Int64(1)).toString())
    print(test4(Int64(2), Int64(1), Int64(1)).toString())
    print(test(Int64(2), Int64(1), Int64(2)).toString())
    print(test2(Int64(2), Int64(1), Int64(2)).toString())
    print(test3(Int64(2), Int64(1), Int64(2)).toString())
    print(test4(Int64(2), Int64(1), Int64(2)).toString())
    print(test(Int64(2), Int64(1), Int64(3)).toString())
    print(test2(Int64(2), Int64(1), Int64(3)).toString())
    print(test3(Int64(2), Int64(1), Int64(3)).toString())
    print(test4(Int64(2), Int64(1), Int64(3)).toString())

    print(test(Float32(5.0), Float32(1.245), Float32(6.0)).toString())
    print(test2(Float32(5.0), Float32(1.245), Float32(6.0)).toString())
    print(test3(Float32(5.0), Float32(1.245), Float32(6.0)).toString())
    print(test4(Float32(5.0), Float32(1.245), Float32(6.0)).toString())
    print(test(Float32(5.0), Float32(1.245), Float32(5.0)).toString())
    print(test2(Float32(5.0), Float32(1.245), Float32(5.0)).toString())
    print(test3(Float32(5.0), Float32(1.245), Float32(5.0)).toString())
    print(test4(Float32(5.0), Float32(1.245), Float32(5.0)).toString())
    print(test(Float32(5.0), Float32(1.245), Float32(3.0)).toString())
    print(test2(Float32(5.0), Float32(1.245), Float32(3.0)).toString())
    print(test3(Float32(5.0), Float32(1.245), Float32(3.0)).toString())
    print(test4(Float32(5.0), Float32(1.245), Float32(3.0)).toString())
    print(test(Float32(5.0), Float32(1.245), Float32(1.245)).toString())
    print(test2(Float32(5.0), Float32(1.245), Float32(1.245)).toString())
    print(test3(Float32(5.0), Float32(1.245), Float32(1.245)).toString())
    print(test4(Float32(5.0), Float32(1.245), Float32(1.245)).toString())
    print(test(Float32(5.0), Float32(1.245), Float32(-1.245)).toString())
    print(test2(Float32(5.0), Float32(1.245), Float32(-1.245)).toString())
    print(test3(Float32(5.0), Float32(1.245), Float32(-1.245)).toString())
    print(test4(Float32(5.0), Float32(1.245), Float32(-1.245)).toString())
    print(test(Float32(0.0), Float32(0.0), Float32(3.0)).toString())
    print(test2(Float32(0.0), Float32(0.0), Float32(3.0)).toString())
    print(test3(Float32(0.0), Float32(0.0), Float32(3.0)).toString())
    print(test4(Float32(0.0), Float32(0.0), Float32(3.0)).toString())
    print(test(Float32(0.0), Float32(0.0), Float32(0.0)).toString())
    print(test2(Float32(0.0), Float32(0.0), Float32(0.0)).toString())
    print(test3(Float32(0.0), Float32(0.0), Float32(0.0)).toString())
    print(test4(Float32(0.0), Float32(0.0), Float32(0.0)).toString())
    print(test(Float32(0.0), Float32(0.0), Float32(-0.2)).toString())
    print(test2(Float32(0.0), Float32(0.0), Float32(-0.2)).toString())
    print(test3(Float32(0.0), Float32(0.0), Float32(-0.2)).toString())
    print(test4(Float32(0.0), Float32(0.0), Float32(-0.2)).toString())
    print(test(Float32(5.0), Float32(5.55), Float32(6.0)).toString())
    print(test2(Float32(5.0), Float32(5.55), Float32(6.0)).toString())
    print(test3(Float32(5.0), Float32(5.55), Float32(6.0)).toString())
    print(test4(Float32(5.0), Float32(5.55), Float32(6.0)).toString())
    print(test(Float32(5.0), Float32(5.55), Float32(5.55)).toString())
    print(test2(Float32(5.0), Float32(5.55), Float32(5.55)).toString())
    print(test3(Float32(5.0), Float32(5.55), Float32(5.55)).toString())
    print(test4(Float32(5.0), Float32(5.55), Float32(5.55)).toString())
    print(test(Float32(5.0), Float32(5.55), Float32(5.23)).toString())
    print(test2(Float32(5.0), Float32(5.55), Float32(5.23)).toString())
    print(test3(Float32(5.0), Float32(5.55), Float32(5.23)).toString())
    print(test4(Float32(5.0), Float32(5.55), Float32(5.23)).toString())
    print(test(Float32(5.0), Float32(5.55), Float32(5.0)).toString())
    print(test2(Float32(5.0), Float32(5.55), Float32(5.0)).toString())
    print(test3(Float32(5.0), Float32(5.55), Float32(5.0)).toString())
    print(test4(Float32(5.0), Float32(5.55), Float32(5.0)).toString())
    print(test(Float32(5.0), Float32(5.55), Float32(-1.245)).toString())
    print(test2(Float32(5.0), Float32(5.55), Float32(-1.245)).toString())
    print(test3(Float32(5.0), Float32(5.55), Float32(-1.245)).toString())
    print(test4(Float32(5.0), Float32(5.55), Float32(-1.245)).toString())

    print(test(Float64(7.0), Float64(12.234556)).toString())
    print(test2(Float64(7.0), Float64(12.234556)).toString())
    print(test3(Float64(7.0), Float64(12.234556)).toString())
    print(test4(Float64(7.0), Float64(12.234556)).toString())
    print(test(Float64(0.2), Float64(0.2)).toString())
    print(test2(Float64(0.2), Float64(0.2)).toString())
    print(test3(Float64(0.2), Float64(0.2)).toString())
    print(test4(Float64(0.2), Float64(0.2)).toString())
    print(test(Float64(8.0), Float64(-0.2450007)).toString())
    print(test2(Float64(8.0), Float64(-0.2450007)).toString())
    print(test3(Float64(8.0), Float64(-0.2450007)).toString())
    print(test4(Float64(8.0), Float64(-0.2450007)).toString())

    return 0
}
