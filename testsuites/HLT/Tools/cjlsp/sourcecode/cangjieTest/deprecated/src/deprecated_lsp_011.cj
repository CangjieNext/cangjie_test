/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

struct Point_Test {
    const Point_Test(let x: Float64, let y: Float64) {}
}

@Deprecated
const func distance(a: Point_Test, b: Point_Test) {
    let dx = a.x - b.x
    let dy = a.y - b.y
    (dx**2 + dy**2)**0.5
}

func testcase11() {
    @Deprecated
    const num1 = Point_Test(3.0, 0.0)
    @Deprecated
    const num2 = Point_Test(0.0, 4.0)
    const d = distance(num1, num2)
}
