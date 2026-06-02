/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package withForeign.other

foreign func get_c_a(): UInt8

public func getCAOther(): UInt8 {
    unsafe {
        return get_c_a()
    }
}

foreign func get_c_b(): UInt8

public func getCBOther(): UInt8 {
    unsafe {
        return get_c_b()
    }
}
