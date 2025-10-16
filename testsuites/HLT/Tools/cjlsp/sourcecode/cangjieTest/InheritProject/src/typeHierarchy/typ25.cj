/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

//标准库类型
var ma1: Box<Int64> = Box<Int64>(8)
var ma2: CString = CString(CPointer<UInt8>())

extend<T> Box<T> {}


