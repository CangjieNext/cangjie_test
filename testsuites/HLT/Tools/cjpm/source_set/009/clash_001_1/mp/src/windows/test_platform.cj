/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

features {os.windows}
package mp

public specific var a: Int32 = 0


public specific func foo(): Int32 {
    println("foo:Windows")
    a
}