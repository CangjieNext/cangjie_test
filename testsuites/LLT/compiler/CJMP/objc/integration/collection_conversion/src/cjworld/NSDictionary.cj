// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package cjworld

import objc.lang.*

@ObjCMirror
public open class NSDictionary/*<KeyT, ValT>*/ <: NSObject {
    public open func count(): NSUInteger
    @ForeignName["enumerateKeysAndObjectsUsingBlock:"] 
    public open func enumerateKeysAndObjectsUsingBlock(aBlock: GSKeysAndObjectsEnumeratorBlock): Unit
    public init()
}

public type GSKeysAndObjectsEnumeratorBlock = ObjCBlock<(ObjCId /*KeyT*/, ObjCId /*ValT*/, ObjCPointer<Bool>) -> Unit>
