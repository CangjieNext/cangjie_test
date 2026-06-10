/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*

// ========== 普通类定义 ==========
class NormalClass1 {
    var name: String
    var id: Int64
    var next: ?GenericClass2<Int64>
    
    public init(name: String, id: Int64) {
        this.name = name
        this.id = id
        this.next = None
    }
}

class NormalClass3 {
    var name: String
    var value: Int64
    var next: ?GenericClass4<String>
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class NormalClass5 {
    var name: String
    var data: Array<Int64>
    
    public init(name: String) {
        this.name = name
        this.data = [1, 2, 3, 4, 5]
    }
}

// ========== 泛型类定义 ==========
class GenericClass2<T> {
    var name: String
    var value: T
    var next: ?NormalClass3
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class GenericClass4<T> {
    var name: String
    var value: T
    var next: ?NormalClass5
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

// ========== 反向引用：泛型类开始 ==========
class StartGeneric1<T> {
    var name: String
    var value: T
    var next: ?NormalNode2
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class NormalNode2 {
    var name: String
    var id: Int64
    var next: ?MiddleGeneric3<Int64>
    
    public init(name: String, id: Int64) {
        this.name = name
        this.id = id
        this.next = None
    }
}

class MiddleGeneric3<T> {
    var name: String
    var value: T
    var next: ?NormalNode4
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class NormalNode4 {
    var name: String
    var count: Int64
    var next: ?EndGeneric5<String>
    
    public init(name: String, count: Int64) {
        this.name = name
        this.count = count
        this.next = None
    }
}

class EndGeneric5<T> {
    var name: String
    var value: T
    var data: Array<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.data = [value, value, value]
    }
}

// ========== 多分支混合引用 ==========
class RootClass {
    var name: String
    var branchA: ?BranchGenericA<Int64>
    var branchB: ?BranchNormalB
    
    public init(name: String) {
        this.name = name
        this.branchA = None
        this.branchB = None
    }
}

class BranchGenericA<T> {
    var name: String
    var value: T
    var next: ?MiddleClass
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class BranchNormalB {
    var name: String
    var id: Int64
    var next: ?MiddleClass
    
    public init(name: String, id: Int64) {
        this.name = name
        this.id = id
        this.next = None
    }
}

class MiddleClass {
    var name: String
    var next: ?EndGenericC<String>
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class EndGenericC<T> {
    var name: String
    var value: T
    var data: ArrayList<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.data = ArrayList<T>()
        this.data.add(value)
    }
}

// ========== 菱形混合引用 ==========
class DiamondStart {
    var name: String
    var left: ?LeftGeneric<Int64>
    var right: ?RightNormal
    
    public init(name: String) {
        this.name = name
        this.left = None
        this.right = None
    }
}

class LeftGeneric<T> {
    var name: String
    var value: T
    var next: ?MergeNode
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class RightNormal {
    var name: String
    var id: Int64
    var next: ?MergeNode
    
    public init(name: String, id: Int64) {
        this.name = name
        this.id = id
        this.next = None
    }
}

class MergeNode {
    var name: String
    var next: ?FinalGeneric<String>
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class FinalGeneric<T> {
    var name: String
    var value: T
    var data: HashMap<String, T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.data = HashMap<String, T>()
    }
}

main() {
    println("========== 类和泛型类混合引用关系示例（5层）==========")
    println("")
    
    // 1. 普通类 → 泛型类 → 普通类 → 泛型类 → 普通类（5层）
    println("1. 创建普通类→泛型类混合引用链（5层）...")
    let normal1 = NormalClass1("NormalClass1", 1)
    let generic2 = GenericClass2<Int64>("GenericClass2<Int64>", 2)
    let normal3 = NormalClass3("NormalClass3", 3)
    let generic4 = GenericClass4<String>("GenericClass4<String>", "Value4")
    let normal5 = NormalClass5("NormalClass5")
    
    normal1.next = Some(generic2)
    generic2.next = Some(normal3)
    normal3.next = Some(generic4)
    generic4.next = Some(normal5)
    println("   引用链创建完成：NormalClass1 → GenericClass2<Int64> → NormalClass3 → GenericClass4<String> → NormalClass5")
    
    // 2. 泛型类 → 普通类 → 泛型类 → 普通类 → 泛型类（5层）
    println("2. 创建泛型类→普通类混合引用链（5层）...")
    let startGeneric1 = StartGeneric1<Int64>("StartGeneric1<Int64>", 100)
    let normalNode2 = NormalNode2("NormalNode2", 200)
    let middleGeneric3 = MiddleGeneric3<Int64>("MiddleGeneric3<Int64>", 300)
    let normalNode4 = NormalNode4("NormalNode4", 400)
    let endGeneric5 = EndGeneric5<String>("EndGeneric5<String>", "End")
    
    startGeneric1.next = Some(normalNode2)
    normalNode2.next = Some(middleGeneric3)
    middleGeneric3.next = Some(normalNode4)
    normalNode4.next = Some(endGeneric5)
    println("   引用链创建完成：StartGeneric1<Int64> → NormalNode2 → MiddleGeneric3<Int64> → NormalNode4 → EndGeneric5<String>")
    
    // 3. 多分支混合引用（RootClass有两个分支，合并到MiddleClass）
    println("3. 创建多分支混合引用...")
    let rootClass = RootClass("RootClass")
    let branchGenericA = BranchGenericA<Int64>("BranchGenericA<Int64>", 10)
    let branchNormalB = BranchNormalB("BranchNormalB", 20)
    let middleClass = MiddleClass("MiddleClass")
    let endGenericC = EndGenericC<String>("EndGenericC<String>", "End")
    
    rootClass.branchA = Some(branchGenericA)
    rootClass.branchB = Some(branchNormalB)
    branchGenericA.next = Some(middleClass)
    branchNormalB.next = Some(middleClass)
    middleClass.next = Some(endGenericC)
    println("   多分支引用创建完成：RootClass → BranchGenericA<Int64>/BranchNormalB → MiddleClass → EndGenericC<String>")
    
    // 4. 菱形混合引用（分叉→合并，5层）
    println("4. 创建菱形混合引用...")
    let diamondStart = DiamondStart("DiamondStart")
    let leftGeneric = LeftGeneric<Int64>("LeftGeneric<Int64>", 50)
    let rightNormal = RightNormal("RightNormal", 60)
    let mergeNode = MergeNode("MergeNode")
    let finalGeneric = FinalGeneric<String>("FinalGeneric<String>", "Final")
    
    diamondStart.left = Some(leftGeneric)
    diamondStart.right = Some(rightNormal)
    leftGeneric.next = Some(mergeNode)
    rightNormal.next = Some(mergeNode)
    mergeNode.next = Some(finalGeneric)
    println("   菱形引用创建完成：DiamondStart → LeftGeneric<Int64>/RightNormal → MergeNode → FinalGeneric<String>")
    
    println("")
    println("========================================")
    println("所有类和泛型类混合引用关系创建完成！")
    println("")
    println("查看普通类→泛型类引用关系（5层）：")
    println("  cjprof heap -i heap_mixed.data --show-reference=\"NormalClass1\" -D 5")
    println("")
    println("查看泛型类→普通类引用关系（5层）：")
    println("  cjprof heap -i heap_mixed.data --show-reference=\"StartGeneric1<Int64>\" -D 5")
    println("")
    println("查看多分支混合引用（5层）：")
    println("  cjprof heap -i heap_mixed.data --show-reference=\"RootClass\" -D 5")
    println("")
    println("查看菱形混合引用（5层）：")
    println("  cjprof heap -i heap_mixed.data --show-reference=\"DiamondStart\" -D 5")
    println("")
    println("查看泛型类被引用关系（反向）：")
    println("  cjprof heap -i heap_mixed.data --show-reference=\"EndGeneric5<String>\" --incoming-reference -D 5")
    println("========================================")
    println("")
    println("程序将在1分钟后自动退出，请在此之前导出堆内存...")
    sleep(Duration.second * 60)
    println("程序退出")
}