/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan class 'ObjectPool' is deprecated.

import std.objectpool.*

class City {
    var id: Int64 = 0
    var name: String = ""
}

func resetCity(c: City): City {
    let city = c
    city.id = 0
    city.name = ""
    return city
}

main() {
    let cityPool = ObjectPool({=> City()}, resetFunc: resetCity)
    let cityA = cityPool.get()
    cityA.id = 30
    cityA.name = "A"
    println("id: ${cityA.id}, name: ${cityA.name}")
    cityPool.put(cityA)
}
