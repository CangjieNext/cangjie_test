/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan id: 0, name:

import std.objectpool.*
import std.collection.*

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
    var cityList = ArrayList<City>()
    let cityA = cityPool.get()
    for (i in 0..10000) {
        cityList.add(cityPool.get())
    }
    println("id: ${cityA.id}, name: ${cityA.name}")
    cityPool.put(cityA)
}
