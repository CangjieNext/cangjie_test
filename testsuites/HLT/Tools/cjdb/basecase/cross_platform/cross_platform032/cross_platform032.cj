/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import mp.*

main(): Int64 {
    var zoo: Zoo<Animal> = Zoo<Animal>()
    zoo.addAnimal(Dog())
    zoo.allAnimalRuns()
    0
}
