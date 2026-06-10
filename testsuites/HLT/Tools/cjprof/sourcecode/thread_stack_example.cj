/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*

class StackObject1 {
    var name: String
    var value: Int64
    var data: Array<Int64>
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.data = [value, value * 2, value * 3]
    }
}

class StackObject2 {
    var id: Int64
    var description: String
    var children: ArrayList<Int64>
    
    public init(id: Int64, description: String) {
        this.id = id
        this.description = description
        this.children = ArrayList<Int64>()
        for (i in 0..5) {
            this.children.add(id * 10 + i)
        }
    }
}

class StackObject3 {
    var key: String
    var value: Float64
    var metadata: HashMap<String, String>
    
    public init(key: String, value: Float64) {
        this.key = key
        this.value = value
        this.metadata = HashMap<String, String>()
    }
}

class StackObject4 {
    var data: ArrayList<String>
    var count: Int64
    
    public init(count: Int64) {
        this.data = ArrayList<String>()
        this.count = count
        for (i in 0..count) {
            this.data.add("Item_${i}")
        }
    }
}

class StackObject5 {
    var name: String
    var buffer: Array<Byte>
    
    public init(name: String, size: Int64) {
        this.name = name
        this.buffer = Array<Byte>(size, repeat: 0)
        for (i in 0..size) {}
    }
}

// ========== 嵌套函数调用（形成栈帧）==========

func functionLevel5(): StackObject5 {
    println(">>> 进入 functionLevel5() - 栈帧第5层")
    
    // 在栈帧第5层创建局部对象
    let localObj5 = StackObject5("StackLevel5_Object", 100)
    println("    创建局部对象: StackObject5 @ functionLevel5")
    
    // 保持运行，等待堆分析
    println("    等待堆内存分析...")
    sleep(Duration.second * 60)  // 等待60秒
    
    return localObj5
}

func functionLevel4(): StackObject4 {
    println(">>> 进入 functionLevel4() - 栈帧第4层")
    
    // 在栈帧第4层创建局部对象
    let localObj4 = StackObject4(20)
    println("    创建局部对象: StackObject4 @ functionLevel4")
    
    // 调用下一层函数（形成调用栈）
    let result5 = functionLevel5()
    println("    从 functionLevel5 返回")
    
    return localObj4
}

func functionLevel3(): StackObject3 {
    println(">>> 进入 functionLevel3() - 栈帧第3层")
    
    // 在栈帧第3层创建局部对象
    let localObj3 = StackObject3("StackLevel3_Key", 123.45)
    println("    创建局部对象: StackObject3 @ functionLevel3")
    
    // 调用下一层函数
    let result4 = functionLevel4()
    println("    从 functionLevel4 返回")
    
    return localObj3
}

func functionLevel2(): StackObject2 {
    println(">>> 进入 functionLevel2() - 栈帧第2层")
    
    // 在栈帧第2层创建局部对象
    let localObj2 = StackObject2(200, "StackLevel2_Object")
    println("    创建局部对象: StackObject2 @ functionLevel2")
    
    // 调用下一层函数
    let result3 = functionLevel3()
    println("    从 functionLevel3 返回")
    
    return localObj2
}

func functionLevel1(): StackObject1 {
    println(">>> 进入 functionLevel1() - 栈帧第1层")
    
    // 在栈帧第1层创建局部对象
    let localObj1 = StackObject1("StackLevel1_Object", 1000)
    println("    创建局部对象: StackObject1 @ functionLevel1")
    
    // 调用下一层函数
    let result2 = functionLevel2()
    println("    从 functionLevel2 返回")
    
    return localObj1
}

// ========== 多线程示例 ==========

class ThreadWorker {
    var threadName: String
    var threadId: Int64
    
    public init(threadName: String, threadId: Int64) {
        this.threadName = threadName
        this.threadId = threadId
    }
    
    public func run() {
        println(">>> 线程 ${threadName} 启动")
        
        // 在线程栈中创建对象
        let threadLocalObj = StackObject1("Thread_${threadName}_Object", threadId * 100)
        println("    线程 ${threadName} 创建局部对象: StackObject1")
        
        // 等待分析
        sleep(Duration.second * 60)
        
        println(">>> 线程 ${threadName} 结束")
    }
}

func workerThreadFunc(name: String, id: Int64) {
    println(">>> 工作线程 ${name} 启动 - 栈帧第1层")
    
    let localObj = StackObject2(id, "Thread_${name}_Local")
    println("    创建局部对象: StackObject2 @ 线程${name}")
    
    // 等待分析
    sleep(Duration.second * 60)
    
    println(">>> 工作线程 ${name} 结束")
}

// ========== 主函数 ==========

main() {
    println("========== 线程栈和栈中引用对象示例 ==========")
    println("")
    
    // 1. 主线程栈帧示例（5层嵌套调用）
    println("1. 创建主线程调用栈（5层嵌套）...")
    println("")
    println("调用栈结构：")
    println("  main()                    <- 栈帧第0层")
    println("    functionLevel1()        <- 栈帧第1层")
    println("      functionLevel2()      <- 栈帧第2层")
    println("        functionLevel3()    <- 栈帧第3层")
    println("          functionLevel4()  <- 栈帧第4层")
    println("            functionLevel5()<- 栈帧第5层")
    println("")
    
    // 在主函数栈帧创建对象
    let mainLocalObj1 = StackObject1("Main_Local_Object1", 1)
    let mainLocalObj2 = StackObject2(2, "Main_Local_Object2")
    println(">>> main() - 栈帧第0层")
    println("    创建局部对象: StackObject1, StackObject2 @ main")
    println("")
    
    // 启动嵌套调用栈
    println("启动嵌套函数调用栈...")
    let result = functionLevel1()
    println("")
    
    // 注意：上面的代码会在 functionLevel5 等待60秒后返回
    // 实际分析时，程序会在深层栈帧等待
    
    // 2. 多线程示例（如果仓颉支持多线程）
    // 注意：这部分代码可能需要根据仓颉实际线程API调整
    println("")
    println("========================================")
    println("程序已进入等待状态！")
    println("")
    println("此时调用栈状态：")
    println("  主线程栈中有多个栈帧和局部对象")
    println("")
    println("导出堆内存：")
    println("")
    println("查看线程栈和栈中引用的对象：")
    println("  cjprof heap -i heap_thread.data --show-thread")
    println("")
    println("输出示例：")
    println("  Object/Stack Frame                   Shallow Heap   Retained Heap")
    println("  ===================================  =============  =============")
    println("  thread0")
    println("    at functionLevel5() (thread_stack_example.cj:XX)")
    println("      <local> StackObject5 @ 0x...                XX            XXX")
    println("    at functionLevel4() (thread_stack_example.cj:XX)")
    println("      <local> StackObject4 @ 0x...                XX            XXX")
    println("    at functionLevel3() (thread_stack_example.cj:XX)")
    println("      <local> StackObject3 @ 0x...                XX            XXX")
    println("    ...")
    println("========================================")
}