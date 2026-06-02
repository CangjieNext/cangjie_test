/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

foreign func testfunc8(i8a: Int8, i8b: Int8):Int8

// todo
public var a: Int8 = 1

public unsafe func newtestfunc(i8a: Int8, i8b: Int8):Int8{
    return testfunc8(i8a, i8b)
}
