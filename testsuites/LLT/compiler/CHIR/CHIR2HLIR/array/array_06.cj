// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto An exception has occurred:
// ASSERT: regex-auto IllegalArgumentException:

main() {
    let arr = Array<Int64>(6, {i => i})
    let a = arr[0..5] // [0, 1, 2, 3, 4]
    if (a.size != 5 || a[0] != 0 || a[4] != 4) {
        return 1
    }
    let b = arr[0..5 : 1] // [0, 1, 2, 3, 4]
    if (b.size != 5 || b[0] != 0 || b[4] != 4) {
        return 2
    }
    let c = arr[0..5 : 2] // [0, 2, 4]
    if (c.size != 3 || c[1] != 2 || c[2] != 4) {
        return 3
    }
    let d = arr[5..0 : -1] // [5, 4, 3, 2, 1]
    if (d.size != 5 || d[0] != 5 || d[4] != 1) {
        return 4
    }
    let e = arr[5..0 : -2] // [5, 3, 1]
    if (e.size != 3 || e[0] != 5 || e[2] != 1) {
        return 5
    }
    let f = arr[0..=5] // [0, 1, 2, 3, 4, 5]
    if (f.size != 6 || f[0] != 0 || f[5] != 5) {
        return 6
    }
    let g = arr[0..=5 : 1] // [0, 1, 2, 3, 4, 5]
    if (g.size != 6 || g[0] != 0 || g[5] != 5) {
        return 7
    }
    let h = arr[0..=5 : 2] // [0, 2, 4]
    if (h.size != 3 || h[0] != 0 || h[2] != 4) {
        return 8
    }
    let i = arr[5..=0 : -1] // [5, 4, 3, 2, 1, 0]
    if (i.size != 6 || i[0] != 5 || i[5] != 0) {
        return 9
    }
    let j = arr[5..=0 : -2] // [5, 3, 1]
    if (j.size != 3 || j[0] != 5 || j[2] != 1) {
        return 10
    }
    let l = arr[..4] // [0, 1, 2, 3]
    if (l.size != 4 || l[0] != 0 || l[3] != 3) {
        return 11
    }
    let m = arr[2..] // [2, 3, 4, 5]
    if (m.size != 4 || m[0] != 2 || m[3] != 5) {
        return 12
    }
    let n = arr[..] // [0, 1, 2, 3, 4, 5]
    if (n.size != 6 || n[0] != 0 || n[5] != 5) {
        return 13
    }
    let r = arr[..=4] // [0, 1, 2, 3, 4]
    if (r.size != 5 || r[0] != 0 || r[4] != 4) {
        return 14
    }
    let t = arr[0..5 : -1] // Array<Int64>()
    if (t.size != 0) {
        return 15
    }
    let u = arr[5..=0] // Array<Int64>()
    if (u.size != 0) {
        return 16
    }
    let v = arr[..0] // Array<Int64>()
    if (v.size != 0) {
        return 17
    }
    try {
        let w = arr[..=-2] // Exceeds the set range and needs to run an exception.
        return 18
    } catch (ee: IndexOutOfBoundsException) {}
    let x = arr[1..] // Array<Int64>()
    if (x.size != 5) {
        return 19
    }
    let y1 = arr[0..1] // Array<Int64>()
    let y2 = arr[1..0 : -1]
    if (y1.size != 1 || y2.size != 1) {
        return 20
    }
    return 0
}
