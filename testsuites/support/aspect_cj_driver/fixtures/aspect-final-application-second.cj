// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// Licensed under Apache-2.0 with Runtime Library Exception.
package aspect_v4_linked_second
import aspect_v4_linked_library.*
public func callLibrary(value: Int64): Unit { business(value) }
main() { callLibrary(9); 0 }
