/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

@Deprecated
abstract class Clazz {
    @Deprecated
    protected func f(): Unit {
        
    }
    @Deprecated
    public prop z: Float64
}

func testDeprecated() {
    var sc: Clazz
    f()
}
