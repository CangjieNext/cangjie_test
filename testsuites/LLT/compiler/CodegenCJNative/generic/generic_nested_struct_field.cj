// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

struct V3<T> {
    let x: T
    let y: T
    let z: T
    init(x: T, y: T, z: T) {
        this.x = x
        this.y = y
        this.z = z
    }
}

struct Scale3<T> {
    let coords: V3<T>
    init(coords: V3<T>) {
        this.coords = coords
    }

    func probeX(): T {
        return this.coords.x
    }
    func probeY(): T {
        return this.coords.y
    }
    func probeZ(): T {
        return this.coords.z
    }
}

main(): Int64 {
    let sf = Scale3<Float64>(V3<Float64>(1.0, 2.0, 3.0))
    if (sf.probeX() != 1.0 || sf.probeY() != 2.0 || sf.probeZ() != 3.0) {
        return 1
    }
    let si = Scale3<Int64>(V3<Int64>(11, 22, 33))
    if (si.probeX() != 11 || si.probeY() != 22 || si.probeZ() != 33) {
        return 2
    }
    return 0
}
