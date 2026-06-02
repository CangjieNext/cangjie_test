// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo
// 导入业务包和数据包
import demo.services.*
import demo.models.*
// 注意：虽然 main 没有直接用 utils，但通过其他包间接使用了

import demo.config.*
import demo.db.*
import demo.security.*
import demo.user.*
import demo.finance.*
import demo.library.*
import demo.notify.*
import demo.analytics.*

main(): Int64 {
    println("=== 欢迎来到仓颉在线商店 ===")

    // 1. 创建一个商品 (来自 models 包)
    let myPhone = Product("Cangjie Phone Pro", 5999.0)

    // 2. 实例化服务 (来自 services 包)
    let service = OrderService()

    // 3. 执行业务逻辑
    service.createOrder(myPhone, 2)

    println("正在启动 SmartCampus 系统 V${AppConfig.VERSION}...")

    // 1. 初始化基础设施
    let db = Database()
    db.connect()
    
    let auth = AuthManager()
    auth.login("Admin")

    // 2. 创建业务对象
    let student = Student("张三", "S1001")
    let notifier = Notifier()

    // 3. 执行业务流程
    // 财务
    let card = CampusCard()
    card.charge(student, 100.0)
    notifier.sendSMS("您的校园卡充值成功")

    // 图书馆
    let lib = LibrarySystem()
    lib.borrowBook(student, "仓颉编程指南")

    // 4. 生成报表
    let report = DailyReport()
    return 0
}