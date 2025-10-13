/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package ohos_app_cangjie_entry

import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll() {
            Column {
                ForEach(
                    Attrs_List,
                    itemGeneratorFunc: {
                        attrName: String, idx: Int64 => Button("View_Attrs_" + Attrs_List[idx])
                            .fontSize(16)
                            .width(100.percent)
                            .height(50)
                            .id(attrName)
                            .borderRadius(10)
                            .onClick {
                                var display = {
                                    =>
                                        println("Hello")
                                        println("World")
                                }
                            }
                    }
                )
            }.width(100.percent).margin(top: 5)
        }.id("Scroll")
    }
}
