 // Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
 package demo.services

 // 导入其他两个包
import demo.models.*
import demo.utils.*

public class OrderService {
    
    // 模拟下单过程
    public func createOrder(product: Product, quantity: Int64): Unit {
        Logger.info("正在处理订单...")
        
        if (quantity <= 0) {
            Logger.error("购买数量必须大于 0")
            return
        }

        let total = product.price * Float64(quantity)
        
        Logger.info("--------------------")
        Logger.info("订单创建成功!")
        product.showDetails() // 调用 models 中的方法
        Logger.info("购买数量: ${quantity}")
        Logger.info("应付总额: ¥${total}")
        Logger.info("--------------------")
    }
}