/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

open class InheritedStaticPropBase {
    public static prop inheritedProp: Int64 {
        get() {
            1
        }
    }
}

public class InheritedStaticPropChild <: InheritedStaticPropBase {
    public static prop ownProp: Int64 {
        get() {
            2
        }
    }
}
