// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package Components

internal import Components.systemlib.*

class ListItem <: Component {
    var content: Array<Component>
    var style: ListItemStyle
    var listItemType: String
    init(content: Array<Component>, id!: String = "", show!: bool = true) {
        this.id = id
        this.show = show
    }
}
