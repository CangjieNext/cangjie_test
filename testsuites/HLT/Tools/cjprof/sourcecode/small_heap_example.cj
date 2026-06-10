/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*

class SimpleData {
    var id: Int64
    var value: Int64
    var name: String
    
    public init(id: Int64, value: Int64) {
        this.id = id
        this.value = value
        this.name = "SimpleData_${id}"
    }
}

class LinkedNode {
    var id: Int64
    var data: Array<Int64>
    var next: ?LinkedNode
    
    public init(id: Int64) {
        this.id = id
        this.data = [id, id * 2, id * 3, id * 4, id * 5]
        this.next = None
    }
}

class BinaryNode {
    var value: Int64
    var left: ?BinaryNode
    var right: ?BinaryNode
    
    public init(value: Int64) {
        this.value = value
        this.left = None
        this.right = None
    }
}

class UserData {
    var userId: Int64
    var username: String
    var email: String
    var scores: ArrayList<Int64>
    
    public init(userId: Int64, username: String, email: String) {
        this.userId = userId
        this.username = username
        this.email = email
        this.scores = ArrayList<Int64>()
        
        for (i in 0..10) {
            this.scores.add(userId * 10 + i)
        }
    }
}

class Product {
    var productId: Int64
    var name: String
    var price: Float64
    var tags: ArrayList<String>
    
    public init(productId: Int64, name: String, price: Float64) {
        this.productId = productId
        this.name = name
        this.price = price
        this.tags = ArrayList<String>()
    }
}

func createLinkedList(count: Int64): LinkedNode {
    let head = LinkedNode(0)
    var current = head
    
    for (i in 1..count) {
        let newNode = LinkedNode(i)
        current.next = Some(newNode)
        current = newNode
    }
    
    return head
}

func createBinarySearchTree(values: Array<Int64>, start: Int64, end: Int64): ?BinaryNode {
    if (start > end) {
        return None
    }
    
    let mid = (start + end) / 2
    let node = BinaryNode(values[mid])
    
    node.left = createBinarySearchTree(values, start, mid - 1)
    node.right = createBinarySearchTree(values, mid + 1, end)
    
    return Some(node)
}

func createUserDataset(count: Int64): ArrayList<UserData> {
    let users = ArrayList<UserData>()
    
    for (i in 0..count) {
        let user = UserData(
            i,
            "user_${i}",
            "user${i}@example.com"
        )
        users.add(user)
    }
    
    return users
}

func createProductDataset(count: Int64): ArrayList<Product> {
    let products = ArrayList<Product>()
    let categories = ["Electronics", "Books", "Clothing", "Food", "Tools"]
    
    for (i in 0..count) {
        let product = Product(
            i,
            "Product_${i}",
            Float64(i * 10 + 99) / 10.0
        )
        
        let tagCount = i % 3 + 1
        for (j in 0..tagCount) {
            product.tags.add(categories[j % categories.size])
        }
        
        products.add(product)
    }
    
    return products
}

main() {
    println("=== 小堆文件示例程序 ===")
    println("程序将创建适量对象以生成 <4GB 的堆内存")
    println("")
    
    // 1. 创建简单数据对象（约1MB）
    println("正在创建简单数据对象...")
    let simpleDataList = ArrayList<SimpleData>()
    for (i in 0..10000) {
        let data = SimpleData(i, i * 100)
        simpleDataList.add(data)
    }
    println("简单数据创建完成：10,000 个对象")
    
    // 2. 创建链表结构（约2MB）
    println("正在创建链表结构...")
    let linkedList = createLinkedList(5000)  // 5千个节点
    println("链表创建完成：5,000 个节点")
    
    // 3. 创建二叉搜索树（约1MB）
    println("正在创建二叉搜索树...")
    let values = Array<Int64>(1000, repeat: 0)
    for (i in 0..1000) {
        values[i] = i
    }
    let bst = createBinarySearchTree(values, 0, 999)
    println("二叉搜索树创建完成：1,000 个节点")
    
    // 4. 创建用户数据集（约5MB）
    println("正在创建用户数据集...")
    let users = createUserDataset(5000)
    println("用户数据创建完成：5,000 个用户")
    
    // 5. 创建产品数据集（约3MB）
    println("正在创建产品数据集...")
    let products = createProductDataset(3000)
    println("产品数据创建完成：3,000 个产品")
    
    // 6. 创建小型缓存
    println("正在创建缓存数据...")
    let cache = HashMap<String, String>()
    for (i in 0..1000) {}
    println("缓存创建完成：1,000 个条目")
    
    // 7. 创建配置对象
    println("正在创建配置对象...")
    let config = HashMap<String, ArrayList<String>>()
    let configKeys = ["database", "server", "cache", "logging", "security"]
    for (key in configKeys) {
        let values = ArrayList<String>()
        values.add("config_${key}_value1")
        values.add("config_${key}_value2")
    }
    println("配置对象创建完成")
    
    println("")
    println("========================================")
    println("所有对象创建完成！")
    println("")
    println("请使用以下命令导出堆内存：")
    println("")
    println("预计堆文件大小：<4GB")
    println("========================================")
    println("")
    println("程序将在1分钟后自动退出，请在此之前导出堆内存...")
    sleep(Duration.second * 60)  // 60秒 = 60000毫秒
    println("程序退出")
}