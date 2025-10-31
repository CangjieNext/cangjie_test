/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

features user.primary.b
package primary

import cmp.pkg1.*
import cmp.pkg2.*

public func h2(): Unit {
    f1()
    f2()
    g1()
    g2()
}

main() {
    h2()
}