/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Point3D {
    var x = 0
    var y = 0
    init(x: Int64, y: Int64, z: Int64) {
        this.x = x
        this.y = y
    }
}

main() {
    let p = Point3D(1, 2, 3)
    println(p.x + p.y)
}
