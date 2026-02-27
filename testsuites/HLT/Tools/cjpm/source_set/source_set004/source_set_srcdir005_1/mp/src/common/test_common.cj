/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
features {os.linux,os.darwin,os.windows,os.ohos}
package mp

public var a: Int64 = 0

public func test_com(): Int64 {
    a
    println("I run on common")
    0
}
