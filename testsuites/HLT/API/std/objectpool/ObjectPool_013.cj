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

class Bus {
    var id: Int64 = 0
    var name: String = ""
}

func resetBus(b: Bus): Bus {
    let bus = b
    bus.id = 0
    bus.name = ""
    return bus
}

main() {
    let testPool = ObjectPool(
        {
            => ObjectPool(
                {
                    => ObjectPool(
                        {=> ObjectPool({=> ObjectPool({=> ObjectPool({=> ObjectPool({=> ObjectPool({=> City()})})})})})})
                })
        })
    let cityPool = testPool.get().get().get().get().get().get().get()
    let busPool = ObjectPool({=> Bus()}, resetFunc: resetBus)
    let cityA = cityPool.get()
    println("id: ${cityA.id}, name: ${cityA.name}")
    cityPool.put(cityA)
}
