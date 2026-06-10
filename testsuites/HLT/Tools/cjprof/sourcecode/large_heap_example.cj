/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class DataBlock {
    var id: Int64
    var data: Array<Int64>
    var name: String
    var next: ?DataBlock
    
    public init(id: Int64) {
        this.id = id
        this.data = Array<Int64>(1024, item: 0)  // 每个对象包含1024个Int64
        for (i in 0..1024) {
            this.data[i] = id * 1000 + i
        }
        this.name = "DataBlock_${id}"
        this.next = None
    }
}

class LargeObject {
    var id: Int64
    var buffer: Array<Byte>
    var description: String
    
    public init(id: Int64, size: Int64) {
        this.id = id
        this.buffer = Array<Byte>(size, item: 0)
        this.description = "LargeObject_${id}_size_${size}"
    }
}

class TreeNode {
    var id: Int64
    var value: Int64
    var left: ?TreeNode
    var right: ?TreeNode
    var data: Array<Int64>
    
    public init(id: Int64, value: Int64) {
        this.id = id
        this.value = value
        this.left = None
        this.right = None
        this.data = Array<Int64>(256, item: value)
    }
}

class ComplexData {
    var id: Int64
    var values: ArrayList<Int64>
    var children: ArrayList<ComplexData>
    var metadata: HashMap<String, String>
    
    public init(id: Int64) {
        this.id = id
        this.values = ArrayList<Int64>()
        this.children = ArrayList<ComplexData>()
        this.metadata = HashMap<String, String>()
        
        for (i in 0..100) {
            this.values.append(id * 1000 + i)
        }
        
        this.metadata.put("id", id.toString())
        this.metadata.put("type", "ComplexData")
        this.metadata.put("created", "2024")
    }
}

func createLinkedList(count: Int64): DataBlock {
    let head = DataBlock(0)
    var current = head
    
    for (i in 1..count) {
        let newNode = DataBlock(i)
        current.next = Some(newNode)
        current = newNode
    }
    
    return head
}

func createBinaryTree(depth: Int64, idCounter: HashMap<String, Int64>): ?TreeNode {
    if (depth == 0) {
        return None
    }
    
    let counter = idCounter.get("counter").getOrThrow()
    let node = TreeNode(counter, counter * 100)
    idCounter.put("counter", counter + 1)
    
    if (depth > 1) {
        node.left = createBinaryTree(depth - 1, idCounter)
        node.right = createBinaryTree(depth - 1, idCounter)
    }
    
    return Some(node)
}

func createComplexDataHierarchy(levels: Int64, breadth: Int64): ArrayList<ComplexData> {
    let roots = ArrayList<ComplexData>()
    
    for (i in 0..breadth) {
        let root = ComplexData(i)
        roots.append(root)
        
        if (levels > 1) {
            let children = createComplexDataHierarchy(levels - 1, breadth / 2)
            for (child in children) {
                root.children.append(child)
            }
        }
    }
    
    return roots
}

main() {
    println("=== 大堆文件示例程序 ===")
    println("程序将创建大量对象以生成 >4GB 的堆内存")
    println("")
    
    // 1. 创建链表结构（约1GB）
    println("正在创建链表结构...")
    let linkedList = createLinkedList(100000)  // 10万个节点
    println("链表创建完成：100,000 个节点")
    
    // 2. 创建大数组对象（约2GB）
    println("正在创建大数组对象...")
    let largeObjects = ArrayList<LargeObject>()
    for (i in 0..200) {
        let obj = LargeObject(i, 10 * 1024 * 1024)  // 每个对象10MB
        largeObjects.append(obj)
    }
    println("大数组创建完成：200 个对象，每个10MB")
    
    // 3. 创建二叉树结构（约500MB）
    println("正在创建二叉树结构...")
    let idCounter = HashMap<String, Int64>()
    idCounter.put("counter", 0)
    let tree = createBinaryTree(15, idCounter)  // 深度15的完全二叉树
    println("二叉树创建完成：约 ${idCounter.get("counter").getOrThrow()} 个节点")
    
    // 4. 创建复杂数据结构（约500MB）
    println("正在创建复杂数据结构...")
    let complexHierarchy = createComplexDataHierarchy(5, 100)
    println("复杂数据结构创建完成")
    
    // 5. 创建大量字符串对象
    println("正在创建字符串对象...")
    let stringPool = ArrayList<String>()
    for (i in 0..100000) {
        let str = "String_pool_item_${i}_${i * i}_${i * i * i}"
        stringPool.append(str)
    }
    println("字符串对象创建完成：100,000 个字符串")
    
    // 6. 创建嵌套集合
    println("正在创建嵌套集合...")
    let nestedCollections = ArrayList<ArrayList<ArrayList<Int64>>>()
    for (i in 0..100) {
        let level2 = ArrayList<ArrayList<Int64>>()
        for (j in 0..100) {
            let level3 = ArrayList<Int64>()
            for (k in 0..100) {
                level3.append(i * 10000 + j * 100 + k)
            }
            level2.append(level3)
        }
        nestedCollections.append(level2)
    }
    println("嵌套集合创建完成：100 x 100 x 100 的三层嵌套")
    
    println("")
    println("========================================")
    println("所有对象创建完成！")
    println("进程ID: ${Process.id}")
    println("")
    println("请使用以下命令导出堆内存：")
    println("  cjprof heap -d ${Process.id} -o large_heap.data")
    println("")
    println("预计堆文件大小：>4GB")
    println("========================================")
    println("")
    println("程序将在1分钟后自动退出，请在此之前导出堆内存...")
    sleep(Duration.second * 60)  // 60秒 = 60000毫秒
    println("程序退出")
}