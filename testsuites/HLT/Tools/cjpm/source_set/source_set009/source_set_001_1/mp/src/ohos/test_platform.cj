/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

features {os.ohos}
package mp

public specific var a: Int64 = 0

public specific func foo(): Int64 {
    println("foo:ohos")
    a
}