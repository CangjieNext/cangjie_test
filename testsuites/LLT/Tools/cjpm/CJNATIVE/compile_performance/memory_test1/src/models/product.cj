// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo.models

// 导入工具包，虽然这里没用到，但演示可以跨包引用
import demo.utils.* 

public class Product {
    public var name: String
    public var price: Float64

    public init(name: String, price: Float64) {
        this.name = name
        this.price = price
    }

    public func showDetails(): Unit {
        // 使用 utils 包的功能
        Logger.info("商品详情: ${name} - 价格: ¥${price}")
    }
}