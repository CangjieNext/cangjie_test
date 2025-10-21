/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testfuncstatic(i8a: Int8, i8b: Int8): Int8

public unsafe func test1newtestfuncstatic(i8a: Int8, i8b: Int8): Int8 {
    return testfuncstatic(i8a, i8b)
}

foreign func MallocWithZero12(size: IntNative): CPointer<Unit>
