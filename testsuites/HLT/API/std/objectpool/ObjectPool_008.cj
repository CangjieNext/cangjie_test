/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output 

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
    let cityA = cityPool.get(11)
    println("id: ${cityA.id}, name: ${cityA.name}")
    cityPool.put(cityA)
}
// ASSERT: scan sema_wrong_number_of_arguments
