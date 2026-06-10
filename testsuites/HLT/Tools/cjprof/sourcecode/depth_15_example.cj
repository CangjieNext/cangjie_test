/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*

// ========== 正向引用链（15层）==========
class Level1 {
    var name: String
    var next: ?Level2
    public init(name: String) { this.name = name; this.next = None }
}

class Level2 {
    var name: String
    var next: ?Level3
    public init(name: String) { this.name = name; this.next = None }
}

class Level3 {
    var name: String
    var next: ?Level4
    public init(name: String) { this.name = name; this.next = None }
}

class Level4 {
    var name: String
    var next: ?Level5
    public init(name: String) { this.name = name; this.next = None }
}

class Level5 {
    var name: String
    var next: ?Level6
    public init(name: String) { this.name = name; this.next = None }
}

class Level6 {
    var name: String
    var next: ?Level7
    public init(name: String) { this.name = name; this.next = None }
}

class Level7 {
    var name: String
    var next: ?Level8
    public init(name: String) { this.name = name; this.next = None }
}

class Level8 {
    var name: String
    var next: ?Level9
    public init(name: String) { this.name = name; this.next = None }
}

class Level9 {
    var name: String
    var next: ?Level10
    public init(name: String) { this.name = name; this.next = None }
}

class Level10 {
    var name: String
    var next: ?Level11
    public init(name: String) { this.name = name; this.next = None }
}

class Level11 {
    var name: String
    var next: ?Level12
    public init(name: String) { this.name = name; this.next = None }
}

class Level12 {
    var name: String
    var next: ?Level13
    public init(name: String) { this.name = name; this.next = None }
}

class Level13 {
    var name: String
    var next: ?Level14
    public init(name: String) { this.name = name; this.next = None }
}

class Level14 {
    var name: String
    var next: ?Level15
    public init(name: String) { this.name = name; this.next = None }
}

class Level15 {
    var name: String
    var data: Array<Int64>
    public init(name: String) { this.name = name; this.data = [1, 2, 3, 4, 5] }
}

// ========== 反向引用链（15层）==========
class BackRef1 {
    var name: String
    var prev: ?BackRef2
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef2 {
    var name: String
    var prev: ?BackRef3
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef3 {
    var name: String
    var prev: ?BackRef4
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef4 {
    var name: String
    var prev: ?BackRef5
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef5 {
    var name: String
    var prev: ?BackRef6
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef6 {
    var name: String
    var prev: ?BackRef7
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef7 {
    var name: String
    var prev: ?BackRef8
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef8 {
    var name: String
    var prev: ?BackRef9
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef9 {
    var name: String
    var prev: ?BackRef10
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef10 {
    var name: String
    var prev: ?BackRef11
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef11 {
    var name: String
    var prev: ?BackRef12
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef12 {
    var name: String
    var prev: ?BackRef13
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef13 {
    var name: String
    var prev: ?BackRef14
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef14 {
    var name: String
    var prev: ?BackRef15
    public init(name: String) { this.name = name; this.prev = None }
}

class BackRef15 {
    var name: String
    var data: Array<Int64>
    public init(name: String) { this.name = name; this.data = [100, 200, 300] }
}

// ========== 菱形引用（深度15层）==========
class Diamond1 {
    var name: String
    var left: ?Diamond2
    var right: ?Diamond3
    public init(name: String) { this.name = name; this.left = None; this.right = None }
}

class Diamond2 {
    var name: String
    var next: ?Diamond4
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond3 {
    var name: String
    var next: ?Diamond5
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond4 {
    var name: String
    var next: ?Diamond6
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond5 {
    var name: String
    var next: ?Diamond6
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond6 {
    var name: String
    var next: ?Diamond7
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond7 {
    var name: String
    var next: ?Diamond8
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond8 {
    var name: String
    var next: ?Diamond9
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond9 {
    var name: String
    var next: ?Diamond10
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond10 {
    var name: String
    var next: ?Diamond11
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond11 {
    var name: String
    var next: ?Diamond12
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond12 {
    var name: String
    var next: ?Diamond13
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond13 {
    var name: String
    var next: ?Diamond14
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond14 {
    var name: String
    var next: ?Diamond15
    public init(name: String) { this.name = name; this.next = None }
}

class Diamond15 {
    var name: String
    var data: Array<Int64>
    public init(name: String) { this.name = name; this.data = [1, 2, 3, 4, 5] }
}

// ========== 树形结构（深度15层）==========
class TreeNode15 {
    var name: String
    var left: ?TreeNode15
    var right: ?TreeNode15
    var level: Int64
    public init(name: String, level: Int64) {
        this.name = name
        this.left = None
        this.right = None
        this.level = level
    }
}

func createTree15(depth: Int64, name: String, level: Int64): ?TreeNode15 {
    if (depth == 0) { return None }
    let node = TreeNode15(name, level)
    if (depth > 1) {
        node.left = createTree15(depth - 1, "${name}_L", level + 1)
        node.right = createTree15(depth - 1, "${name}_R", level + 1)
    }
    return Some(node)
}

// ========== 循环引用示例 ==========
class CircularA15 {
    var name: String
    var ref: ?CircularB15
    public init(name: String) { this.name = name; this.ref = None }
}

class CircularB15 {
    var name: String
    var ref: ?CircularA15
    public init(name: String) { this.name = name; this.ref = None }
}

main() {
    println("========== 15层引用深度示例 ==========")
    println("")
    
    // 1. 创建正向引用链（15层）
    println("1. 创建正向引用链（15层）...")
    let level1 = Level1("Level1")
    let level2 = Level2("Level2")
    let level3 = Level3("Level3")
    let level4 = Level4("Level4")
    let level5 = Level5("Level5")
    let level6 = Level6("Level6")
    let level7 = Level7("Level7")
    let level8 = Level8("Level8")
    let level9 = Level9("Level9")
    let level10 = Level10("Level10")
    let level11 = Level11("Level11")
    let level12 = Level12("Level12")
    let level13 = Level13("Level13")
    let level14 = Level14("Level14")
    let level15 = Level15("Level15")
    
    level1.next = Some(level2)
    level2.next = Some(level3)
    level3.next = Some(level4)
    level4.next = Some(level5)
    level5.next = Some(level6)
    level6.next = Some(level7)
    level7.next = Some(level8)
    level8.next = Some(level9)
    level9.next = Some(level10)
    level10.next = Some(level11)
    level11.next = Some(level12)
    level12.next = Some(level13)
    level13.next = Some(level14)
    level14.next = Some(level15)
    println("   正向引用链创建完成")
    
    // 2. 创建反向引用链（15层）
    println("2. 创建反向引用链（15层）...")
    let backRef1 = BackRef1("BackRef1")
    let backRef2 = BackRef2("BackRef2")
    let backRef3 = BackRef3("BackRef3")
    let backRef4 = BackRef4("BackRef4")
    let backRef5 = BackRef5("BackRef5")
    let backRef6 = BackRef6("BackRef6")
    let backRef7 = BackRef7("BackRef7")
    let backRef8 = BackRef8("BackRef8")
    let backRef9 = BackRef9("BackRef9")
    let backRef10 = BackRef10("BackRef10")
    let backRef11 = BackRef11("BackRef11")
    let backRef12 = BackRef12("BackRef12")
    let backRef13 = BackRef13("BackRef13")
    let backRef14 = BackRef14("BackRef14")
    let backRef15 = BackRef15("BackRef15")
     
    // 3. 创建菱形引用（深度15层）
    println("3. 创建菱形引用（15层）...")
    let d1 = Diamond1("Diamond1")
    let d2 = Diamond2("Diamond2")
    let d3 = Diamond3("Diamond3")
    let d4 = Diamond4("Diamond4")
    let d5 = Diamond5("Diamond5")
    let d6 = Diamond6("Diamond6")
    let d7 = Diamond7("Diamond7")
    let d8 = Diamond8("Diamond8")
    let d9 = Diamond9("Diamond9")
    let d10 = Diamond10("Diamond10")
    let d11 = Diamond11("Diamond11")
    let d12 = Diamond12("Diamond12")
    let d13 = Diamond13("Diamond13")
    let d14 = Diamond14("Diamond14")
    let d15 = Diamond15("Diamond15")
    
    d1.left = Some(d2)
    d1.right = Some(d3)
    d2.next = Some(d4)
    d3.next = Some(d5)
    d4.next = Some(d6)
    d5.next = Some(d6)
    d6.next = Some(d7)
    d7.next = Some(d8)
    d8.next = Some(d9)
    d9.next = Some(d10)
    d10.next = Some(d11)
    d11.next = Some(d12)
    d12.next = Some(d13)
    d13.next = Some(d14)
    d14.next = Some(d15)
    println("   菱形引用创建完成")
    
    // 4. 创建树形结构（深度15层）
    println("4. 创建树形结构（深度15层）...")
    let tree = createTree15(15, "Root", 1)
    println("   树形结构创建完成")
    
    // 5. 创建循环引用
    println("5. 创建循环引用...")
    let circularA = CircularA15("CircularA")
    let circularB = CircularB15("CircularB")
    circularA.ref = Some(circularB)
    circularB.ref = Some(circularA)
    println("   循环引用创建完成")
    
    println("")
    println("========================================")
    println("")
    println("查看引用关系（正向，15层）：")
    println("  cjprof heap -i heap_depth_15.data --show-reference=\"Level1\" -D 15")
    println("")
    println("查看被引用关系（反向，15层）：")
    println("  cjprof heap -i heap_depth_15.data --show-reference=\"BackRef15\" --incoming-reference -D 15")
    println("")
    println("查看菱形引用（15层）：")
    println("  cjprof heap -i heap_depth_15.data --show-reference=\"Diamond1\" -D 15")
    println("========================================")
    println("")
    println("程序将在1分钟后自动退出，请在此之前导出堆内存...")
    sleep(Duration.second * 60)  // 60秒 = 60000毫秒
    println("程序退出")
}