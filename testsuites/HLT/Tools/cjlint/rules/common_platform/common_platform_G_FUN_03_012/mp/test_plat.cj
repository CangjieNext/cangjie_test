/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform interface Entity {
    platform prop id: String
}

platform interface Repository<T> where T <: Entity {
    platform func save(entity: T): Unit { 
        print(entity)
    }
}
