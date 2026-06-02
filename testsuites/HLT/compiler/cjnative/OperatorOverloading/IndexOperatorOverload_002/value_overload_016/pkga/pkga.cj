/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public var a: Int16 = 0
public var b: UInt16 = 0
public var c: Int8 = 0
public var d: UInt8 = 0
public var e: Float16 = 0.0

public interface I {
    operator func [](arg1: Int16, arg2: UInt16, arg3: Int8, arg4: UInt8, arg5: Float16): I {
        while (arg1 >= 0) {
            a = (arg1 + 1) * 2
            break
        }
        b = match (arg2) {
            case 2 => arg2 * 2
            case _ => arg2
        }
        c = if (arg3 > 0) {
            arg3 + arg3
        } else {
            arg3 * arg3
        }
        d = (arg4)
        e = {=> arg5}()
        return this
    }
}
