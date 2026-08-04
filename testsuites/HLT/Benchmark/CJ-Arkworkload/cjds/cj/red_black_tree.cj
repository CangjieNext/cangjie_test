/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class ArrayResult {
    let key: Object
    let value: Object
    
    init(key: Object, value: Object) {
        this.key = key
        this.value = value
    }
}

class InsertionResult {
    var isNewEntry: Bool
    var oldValue: ?Object
    var newNode: ?Node
    
    init(isNewEntry: Bool, oldValue!: ?Object = Option<Object>.None, newNode!: ?Node = Option<Node>.None) {
        this.isNewEntry = isNewEntry
        this.oldValue = oldValue
        this.newNode = newNode
    }
}

func compare(a: Object, b: Object): Int64 {
    if ((a as Vector2D).isSome() && (b as Vector2D).isSome()) {
        return (a as Vector2D).getOrThrow().compareTo((b as Vector2D).getOrThrow())
    }
    if ((a as CallSign).isSome() && (b as CallSign).isSome()) {
        return (a as CallSign).getOrThrow().compareTo((b as CallSign).getOrThrow())
    }
    print("Mismatched types")
    return 0
}

func treeMinimum(x: Node): Node {
    var y = x
    while (y.left.isSome()) {
        y = y.left.getOrThrow()
    }
    return y
}

func treeMaximum(x: Node): Node {
    var y = x
    while (y.right.isSome()) {
        y = y.right.getOrThrow()
    }
    return y
}

func refEq_1(x: Option<Node>, y: Option<Node>): Bool {
    if (x.isSome() && y.isSome() && refEq(x.getOrThrow(), y.getOrThrow())) {
        return true
    } else {
        return false
    }
}

public interface CustomStringConvertible {
    prop description: String
}

class Node {
    let key: Object
    var value: Object
    var left: ?Node = Option<Node>.None
    var right: ?Node = Option<Node>.None
    var parent: ?Node = Option<Node>.None
    var color: String = "red"
    
    init(key: Object, value: Object) {
        this.key = key
        this.value = value
    }

    func successor(): ?Node {
        var x: Node = this
        if (x.right.isSome()) {
            return treeMinimum(x.right.getOrThrow())
        }
        var y = x.parent
        while (y.isSome() && refEq_1(x, y.getOrThrow().right)) {
            x = y.getOrThrow()
            y = y.getOrThrow().parent
        }
        return y
    }
    
    func predecessor(): ?Node {
        var x: Node = this
        if (x.left.isSome()) {
            return treeMaximum(x.left.getOrThrow())
        }
        var y = x.parent
        while (y.isSome() && refEq_1(x, y.getOrThrow().left)) {
            x = y.getOrThrow()
            y = y.getOrThrow().parent
        }
        return y
    }
}

extend Node <: ToString {
    public func toString(): String {
        "${(key as CustomStringConvertible).getOrThrow().description}" + "=>" + "${(value as CustomStringConvertible).getOrThrow().description}" + " (" + "${color}" + ")"
    }
}

class RedBlackTree {
    var root: ?Node
    
    init() {
        root = Option<Node>.None
    }

    func put(key: Object, value: Object): ?Object {
        let insertionResult = treeInsert(key, value)
        if (!(insertionResult.isNewEntry)) {
            return insertionResult.oldValue
        }
        var x = insertionResult.newNode.getOrThrow()
        while (!refEq_1(x, root) && x.parent.getOrThrow().color == "red") {
            if (refEq_1(x.parent, x.parent.getOrThrow().parent.getOrThrow().left)) {
                let y = x.parent.getOrThrow().parent.getOrThrow().right
                if (y.isSome() && y.getOrThrow().color == "red") {
                    x.parent.getOrThrow().color = "black"
                    y.getOrThrow().color = "black"
                    x.parent.getOrThrow().parent.getOrThrow().color = "red"
                    x = x.parent.getOrThrow().parent.getOrThrow()
                } else {
                    if (refEq_1(x, x.parent.getOrThrow().right)) {
                        x = x.parent.getOrThrow()
                        leftRotate(x)
                    }
                    x.parent.getOrThrow().color = "black"
                    x.parent.getOrThrow().parent.getOrThrow().color = "red"
                    rightRotate(x.parent.getOrThrow().parent.getOrThrow())
                }
            } else {
                // Same as "then" clause with "right" and "left" exchanged. 
                let y = x.parent.getOrThrow().parent.getOrThrow().left
                if (y.isSome() && y.getOrThrow().color == "red") {
                    x.parent.getOrThrow().color = "black"
                    y.getOrThrow().color = "black"
                    x.parent.getOrThrow().parent.getOrThrow().color = "red"
                    x = x.parent.getOrThrow().parent.getOrThrow()
                } else {
                    if (refEq_1(x, x.parent.getOrThrow().left)) {
                        x = x.parent.getOrThrow()
                        rightRotate(x)
                    }
                    x.parent.getOrThrow().color = "black"
                    x.parent.getOrThrow().parent.getOrThrow().color = "red"
                    leftRotate(x.parent.getOrThrow().parent.getOrThrow())
                }
            }
        }

        root.getOrThrow().color = "black"
        return Option<Object>.None
    }
    
    func remove(key: Object): ?Object {
        var z: ?Node = findNode(key)
        if (z.isNone()) {
            return Option<Object>.None
        }
        
        // Y is the node to be unlinked from the tree.
        var y: ?Node = getYByZ(z)
        // Y is guaranteed to be non-null at this point.
        var x: ?Node = getXByY(y)
        
        // X is the child of y which might potentially replace y in the tree. X might be null at
        // this point.
        var xParent: ?Node
        if (x.isSome()) {
            x.getOrThrow().parent = y.getOrThrow().parent
            xParent = x.getOrThrow().parent
        } else {
            xParent = y.getOrThrow().parent
        }
        
        if (y.getOrThrow().parent.isNone()) {
            root = x
        } else {
            if (refEq_1(y, y.getOrThrow().parent.getOrThrow().left)) {
                y.getOrThrow().parent.getOrThrow().left = x
            } else {
                y.getOrThrow().parent.getOrThrow().right = x
            }
        }
        
        z = recalculateZ(x, y, z, xParent)
        return z.getOrThrow().value
    }
    
    func getYByZ(z: ?Node): ?Node {
        if (z.getOrThrow().left.isNone() || z.getOrThrow().right.isNone()) {
            return z;
        } else {
            return z.getOrThrow().successor();
        }
    }

    func getXByY(y: ?Node): ?Node { 
        if (y.getOrThrow().left.isSome()) {
            return y.getOrThrow().left;
        } else {
            return y.getOrThrow().right;
        }
    }
    
    func recalculateZ(x: ?Node, y: ?Node, z: ?Node, xParent: ?Node): ?Node {
        if (!refEq_1(y, z)) {
            if (y.getOrThrow().color == "black") {
                removeFixup(x, xParent)
            }
            
            y.getOrThrow().parent = z.getOrThrow().parent
            y.getOrThrow().color = z.getOrThrow().color
            y.getOrThrow().left = z.getOrThrow().left
            y.getOrThrow().right = z.getOrThrow().right
            if (z.getOrThrow().left.isSome()) {
                z.getOrThrow().left.getOrThrow().parent = y
            }
            if (z.getOrThrow().right.isSome()) {
                z.getOrThrow().right.getOrThrow().parent = y
            }
            
            if (z.getOrThrow().parent.isSome()) {
                if (refEq_1(z.getOrThrow().parent.getOrThrow().left, z)) {
                    z.getOrThrow().parent.getOrThrow().left = y
                } else {
                    z.getOrThrow().parent.getOrThrow().right = y
                }
            } else {
                root = y
            }

        } else if (y.getOrThrow().color == "black") {
            removeFixup(x, xParent)
        }
        
        return z
    }
    
    func get(key: Object): ?Object {  
        let node: ?Node = findNode(key)
        if (node.isNone()) {
            return Option<Object>.None
        } 
        return node.getOrThrow().value
    }
    
    func forEach(callBack: (Object, Object) -> Unit) {     
        if (root.isNone()) {
            return
        }
        var current: ?Node = treeMinimum(root.getOrThrow())
        while (current.isSome()) {
            callBack(current.getOrThrow().key, current.getOrThrow().value)
            current = current.getOrThrow().successor()
        }
    }
    
    func asArray(): ArrayList<ArrayResult> {     
        let result: ArrayList<ArrayResult> = ArrayList<ArrayResult>()
        forEach({key: Object, value: Object => result.add(ArrayResult(key, value))})
        return result
    }
    
    func findNode(key: Object): ?Node {    
        var current = root
        while (current.isSome()) {
            let comparisonResult = compare(key, current.getOrThrow().key)
            if (comparisonResult == 0) {
                return current
            }
            if (comparisonResult < 0) {
                current = current.getOrThrow().left
            } else {
                current = current.getOrThrow().right
            }
        }
        return Option<Node>.None
    }
    
    func treeInsert(key: Object, value: Object): InsertionResult {
        var y: ?Node = Option<Node>.None
        var x = root
        
        while (x.isSome()) {
            y = x
            
            var comparisonResult = 0
            if ((key as Vector2D).isSome() && (x.getOrThrow().key as Vector2D).isSome()) {
                comparisonResult = (key as Vector2D).getOrThrow().compareTo((x.getOrThrow().key as Vector2D).getOrThrow())
            } else if ((key as CallSign).isSome() && (x.getOrThrow().key as CallSign).isSome()) {
                comparisonResult = (key as CallSign).getOrThrow().compareTo((x.getOrThrow().key as CallSign).getOrThrow())                
            }

            if (comparisonResult < 0) {
                x = x.getOrThrow().left
            } else if (comparisonResult > 0) {
                x = x.getOrThrow().right
            } else {
                let oldValue = x.getOrThrow().value
                x.getOrThrow().value = value
                return InsertionResult(false, oldValue: oldValue, newNode: Option<Node>.None)
            }
        }

        let z = Node(key, value)
        z.parent = y
        
        if (y.isNone()) {
            root = z
        } else {
            var comparisonResult = 0
            if ((key as Vector2D).isSome() && (y.getOrThrow().key as Vector2D).isSome()) {
                comparisonResult = (key as Vector2D).getOrThrow().compareTo((y.getOrThrow().key as Vector2D).getOrThrow())       
            } else if ((key as CallSign).isSome() && (y.getOrThrow().key as CallSign).isSome()) {
                comparisonResult = (key as CallSign).getOrThrow().compareTo((y.getOrThrow().key as CallSign).getOrThrow())
            }

            if (comparisonResult < 0) {
                y.getOrThrow().left = z
            } else {
                y.getOrThrow().right = z
            }
        }

        return InsertionResult(true, oldValue: Option<Object>.None, newNode: Option<Node>.Some(z))
    }
    
    func leftRotate(x: Node): Node {
        let y = x.right
        
        // Turn y's left subtree into x's right subtree.
        x.right = y.getOrThrow().left
        if (y.getOrThrow().left.isSome()) {
            y.getOrThrow().left.getOrThrow().parent = x
        }
        
        // Link x's parent to y.
        y.getOrThrow().parent = x.parent
        if (x.parent.isNone()) {
            root = y
        } else {
            if (refEq_1(x, x.parent.getOrThrow().left)) {
                x.parent.getOrThrow().left = y
            } else {
                x.parent.getOrThrow().right = y
            }
        }
        
        // Put x on y's left.
        y.getOrThrow().left = x
        x.parent = y
        
        return y.getOrThrow()
    }
    
    func rightRotate(y: Node): Node {
       let x = y.left
        
        // Turn x's right subtree into y's left subtree.
        y.left = x.getOrThrow().right
        if (x.getOrThrow().right.isSome()) {
            x.getOrThrow().right.getOrThrow().parent = y
        }
        
        // Link y's parent to x;
        x.getOrThrow().parent = y.parent
        if (y.parent.isNone()) {
            root = x
        } else {
            if (refEq_1(y, y.parent.getOrThrow().left)) {
                y.parent.getOrThrow().left = x
            } else {
                y.parent.getOrThrow().right = x
            }
        }
        
        x.getOrThrow().right = y
        y.parent = x
        
        return x.getOrThrow()
    }
    
    func removeFixup(x: ?Node, xParent: ?Node) {
        var y = x
        var yParent = xParent
        while (!refEq_1(y, root) && (y.isNone() || y.getOrThrow().color == "black")) {
            if (refEq_1(y, yParent.getOrThrow().left)) {
                let (res_y, res_yParent) = xEqualParentLeft(y, yParent)
                y = res_y
                yParent = res_yParent
            } else {
                let (res_y, res_yParent) = xEqualParentRight(y, yParent)
                y = res_y
                yParent = res_yParent
            }
        }
        if (y.isSome()) {
            y.getOrThrow().color = "black"
        }
    }
    
    func xEqualParentLeft(x: ?Node, xParent: ?Node): (?Node, ?Node) {  
        // Note: the text points out that w cannot be null. The reason is not obvious from
        // simply looking at the code; it comes about from the properties of the red-black
        // tree.
        var x_tmp: ?Node = x
        var xParent_tmp: ?Node = xParent
        var w = xParent_tmp.getOrThrow().right
        if (w.getOrThrow().color == "red") {
            // Case 1
            w.getOrThrow().color = "black"
            xParent_tmp.getOrThrow().color = "red"
            leftRotate(xParent_tmp.getOrThrow())
            w = xParent_tmp.getOrThrow().right
        }
        if ((w.getOrThrow().left.isNone() || w.getOrThrow().left.getOrThrow().color == "black") && (w.getOrThrow().right.isNone() || w.getOrThrow().right.getOrThrow().color == "black")) {
            // Case 2
            w.getOrThrow().color = "red"
            x_tmp = xParent_tmp
            xParent_tmp = x_tmp.getOrThrow().parent
        } else {
            if (w.getOrThrow().right.isNone() || w.getOrThrow().right.getOrThrow().color == "black") {
                // Case 3
                w.getOrThrow().left.getOrThrow().color = "black"
                w.getOrThrow().color = "red"
                rightRotate(w.getOrThrow())
                w = xParent_tmp.getOrThrow().right
            }
            // Case 4
            w.getOrThrow().color = xParent_tmp.getOrThrow().color
            xParent_tmp.getOrThrow().color = "black"
            if (w.getOrThrow().right.isSome()) {
                w.getOrThrow().right.getOrThrow().color = "black"
            }
            leftRotate(xParent_tmp.getOrThrow())
            x_tmp = root
            xParent_tmp = x_tmp.getOrThrow().parent
        }
        
        return (x_tmp, xParent_tmp)
    }
    
    func xEqualParentRight(x: ?Node, xParent: ?Node): (?Node, ?Node) {
        // Same as "then" clause with "right" and "left" exchanged.
        var x_tmp: ?Node = x
        var xParent_tmp: ?Node = xParent
        var w = xParent_tmp.getOrThrow().left
        if (w.getOrThrow().color == "red") {
            // Case 1
            w.getOrThrow().color = "black"
            xParent_tmp.getOrThrow().color = "red"
            rightRotate(xParent_tmp.getOrThrow())
            w = xParent_tmp.getOrThrow().left
        }
        if ((w.getOrThrow().right.isNone() || w.getOrThrow().right.getOrThrow().color == "black") && (w.getOrThrow().left.isNone() || w.getOrThrow().left.getOrThrow().color == "black")) {
            // Case 2
            w.getOrThrow().color = "red"
            x_tmp = xParent_tmp
            xParent_tmp = x_tmp.getOrThrow().parent
        } else {
            if (w.getOrThrow().left.isNone() || w.getOrThrow().left.getOrThrow().color == "black") {
                // Case 3
                w.getOrThrow().right.getOrThrow().color = "black"
                w.getOrThrow().color = "red"
                leftRotate(w.getOrThrow())
                w = xParent_tmp.getOrThrow().left
            }
            // Case 4
            w.getOrThrow().color = xParent_tmp.getOrThrow().color
            xParent_tmp.getOrThrow().color = "black"
            if (w.getOrThrow().left.isSome()) {
                w.getOrThrow().left.getOrThrow().color = "black"
            }
            rightRotate(xParent_tmp.getOrThrow())
            x_tmp = root
            xParent_tmp = x_tmp.getOrThrow().parent
        }
        
        return (x_tmp, xParent_tmp)
    }
}

extend RedBlackTree <: ToString {
    public func toString(): String {
        let result = ["["]
        let first = [true]
        forEach({key: Object, value: Object => if (first[0]) {
                    first[0] = false
                } else {
                    result[0] = result[0] + ", "
                }
                result[0] = result[0] + "${(key as CustomStringConvertible).getOrThrow().description}" + "=>" + "${(value as CustomStringConvertible).getOrThrow().description}"})
        return result[0] + "]"
    }
}