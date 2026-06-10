/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*

// ========== 正向引用链（5层）==========
class Level1 {
    var name: String
    var value: Int64
    var next: ?Level2
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Level2 {
    var name: String
    var value: Int64
    var next: ?Level3
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Level3 {
    var name: String
    var value: Int64
    var next: ?Level4
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Level4 {
    var name: String
    var value: Int64
    var next: ?Level5
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Level5 {
    var name: String
    var value: Int64
    var data: Array<Int64>
    
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
        this.data = [value, value * 2, value * 3]
    }
}

// ========== 反向引用链（5层）==========
class BackRef1 {
    var name: String
    var prev: ?BackRef2
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackRef2 {
    var name: String
    var prev: ?BackRef3
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackRef3 {
    var name: String
    var prev: ?BackRef4
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackRef4 {
    var name: String
    var prev: ?BackRef5
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackRef5 {
    var name: String
    var data: Array<Int64>
    
    public init(name: String) {
        this.name = name
        this.data = [100, 200, 300]
    }
}

// ========== 多分支引用（深度5层）==========
class MultiBranch1 {
    var name: String
    var branchA: ?MultiBranch2A
    var branchB: ?MultiBranch2B
    
    public init(name: String) {
        this.name = name
        this.branchA = None
        this.branchB = None
    }
}

class MultiBranch2A {
    var name: String
    var next: ?MultiBranch3A
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class MultiBranch3A {
    var name: String
    var next: ?MultiBranch4A
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class MultiBranch4A {
    var name: String
    var next: ?MultiBranch5A
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class MultiBranch5A {
    var name: String
    var data: Array<Int64>
    
    public init(name: String) {
        this.name = name
        this.data = [1, 2, 3]
    }
}

class MultiBranch2B {
    var name: String
    var next: ?MultiBranch3B
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class MultiBranch3B {
    var name: String
    var next: ?MultiBranch4B
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class MultiBranch4B {
    var name: String
    var next: ?MultiBranch5B
    
    public init(name: String) {
        this.name = name
        this.next = None
    }
}

class MultiBranch5B {
    var name: String
    var data: Array<Int64>
    
    public init(name: String) {
        this.name = name
        this.data = [4, 5, 6]
    }
}

// ========== 树形结构（深度5层）==========
class TreeNode5 {
    var name: String
    var left: ?TreeNode5
    var right: ?TreeNode5
    var level: Int64
    
    public init(name: String, level: Int64) {
        this.name = name
        this.left = None
        this.right = None
        this.level = level
    }
}

func createTree5(depth: Int64, name: String, level: Int64): ?TreeNode5 {
    if (depth == 0) {
        return None
    }
    
    let node = TreeNode5(name, level)
    
    if (depth > 1) {
        node.left = createTree5(depth - 1, "${name}_L", level + 1)
        node.right = createTree5(depth - 1, "${name}_R", level + 1)
    }
    
    return Some(node)
}

main() {
    println("========== 5层引用深度示例 ==========")
    println("")
    
    // 1. 创建正向引用链（Level1 -> Level2 -> Level3 -> Level4 -> Level5）
    println("1. 创建正向引用链（5层）...")
    let level1 = Level1("Level1", 1)
    let level2 = Level2("Level2", 2)
    let level3 = Level3("Level3", 3)
    let level4 = Level4("Level4", 4)
    let level5 = Level5("Level5", 5)
    
    level1.next = Some(level2)
    level2.next = Some(level3)
    level3.next = Some(level4)
    level4.next = Some(level5)
    println("   正向引用链创建完成")
    
    // 2. 创建反向引用链（BackRef1 <- BackRef2 <- BackRef3 <- BackRef4 <- BackRef5）
    println("2. 创建反向引用链（5层）...")
    let backRef1 = BackRef1("BackRef1")
    let backRef2 = BackRef2("BackRef2")
    let backRef3 = BackRef3("BackRef3")
    let backRef4 = BackRef4("BackRef4")
    let backRef5 = BackRef5("BackRef5")
 
    // 3. 创建多分支引用
    println("3. 创建多分支引用（5层，两个分支）...")
    let multiBranch1 = MultiBranch1("MultiBranch1")
    let branch2A = MultiBranch2A("Branch2A")
    let branch3A = MultiBranch3A("Branch3A")
    let branch4A = MultiBranch4A("Branch4A")
    let branch5A = MultiBranch5A("Branch5A")
    
    let branch2B = MultiBranch2B("Branch2B")
    let branch3B = MultiBranch3B("Branch3B")
    let branch4B = MultiBranch4B("Branch4B")
    let branch5B = MultiBranch5B("Branch5B")
    
    multiBranch1.branchA = Some(branch2A)
    multiBranch1.branchB = Some(branch2B)
    branch2A.next = Some(branch3A)
    branch3A.next = Some(branch4A)
    branch4A.next = Some(branch5A)
    branch2B.next = Some(branch3B)
    branch3B.next = Some(branch4B)
    branch4B.next = Some(branch5B)
    println("   多分支引用创建完成")
    
    // 4. 创建树形结构（深度5层）
    println("4. 创建树形结构（深度5层）...")
    let tree = createTree5(5, "Root", 1)
    println("   树形结构创建完成")
    
    println("")
    println("========================================")
    println("")
    println("导出堆内存：")
    println("")
    println("查看引用关系（正向，5层）：")
    println("  cjprof heap -i heap_depth_5.data --show-reference=\"Level1\" -D 5")
    println("")
    println("查看被引用关系（反向，5层）：")
    println("  cjprof heap -i heap_depth_5.data --show-reference=\"BackRef5\" --incoming-reference -D 5")
    println("")
    println("查看多分支引用（5层）：")
    println("  cjprof heap -i heap_depth_5.data --show-reference=\"MultiBranch1\" -D 5")
    println("========================================")
    println("")
    println("程序将在1分钟后自动退出，请在此之前导出堆内存...")
    sleep(Duration.second * 60) // 60秒 = 60000毫秒
    println("程序退出")
}