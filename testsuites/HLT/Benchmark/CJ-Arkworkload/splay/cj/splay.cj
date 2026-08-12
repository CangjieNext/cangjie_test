/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms



import std.time.*
import std.collection.*
import std.random.*
import std.math.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
        return start_time
    }

    public func stop() {
        end_time = DateTime.now()
        return end_time
    }
    // ms
    public func getTime(): Float64 {
        let time = DateTime.now()
        return Float64(time.second) * 1000.0 + Float64(time.nanosecond)/ 1000000.0
    }
}

class PayloadTree0 {
    var array: Array<Int32>
    var str: String
    init(array: Array<Int32>,str: String) {
        this.array = array
        this.str = str
    }
}

class PayloadTreeDepth {
    var left: Object
    var right: Object
    init(left: Object, right: Object) {
        this.left = left
        this.right = right
    }
}

class Splay {
    // Configuration
    let kSplayTreeSize: Int64 = 8000
    let kSplayTreeModifications: Int64 = 80
    let kSplayTreePayloadDepth: Int64 = 5
    var splayTree: ?SplayTree = Option<SplayTree>.None
    var splaySampleTimeStart: Float64 = 0.0
    var splaySamples: ArrayList<Float64> = ArrayList<Float64>()

    func GeneratePayloadTree(depth: Int64, tag: String): Object {
        if (depth == 0) {
            return PayloadTree0([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], "String for key ${tag} in leaf node")
        } else {
            return PayloadTreeDepth( GeneratePayloadTree(depth - 1, tag), GeneratePayloadTree(depth - 1, tag))
        }
    }

    let random = Random()

    func GenerateKey(): Float64 {
        // The benchmark framework guarantees that Math.random is
        // deterministic; see base.js.
        return random.nextFloat64()
    }

    func SplayUpdateStats(time: Float64) {
        let pause = time - splaySampleTimeStart
        splaySampleTimeStart = time
        splaySamples.add(pause)
    }

    func InsertNewNode(): Float64 {
        // Insert new node with a unique key.
        var key: Float64
        do {
            key = GenerateKey()
        } while ((splayTree.getOrThrow().find(key)).isSome())

        let payload = GeneratePayloadTree(kSplayTreePayloadDepth, key.toString())
        splayTree.getOrThrow().insert(key, payload)
        return key
    }
    // @Setup
    func SplaySetup() {
        // Check if the platform has the performance.now high resolution timer.
        // If not, throw exception and quit.
        if (Timer().getTime() == 0.0) {
            
            return
        }
        splayTree = SplayTree()
        splaySampleTimeStart = Float64(Timer().getTime())
        for (i in 0..kSplayTreeSize) {
            _ = InsertNewNode()
            if ((i + 1) % 20 == 19) {
                SplayUpdateStats(Float64(Timer().getTime()))
            }
        }
    }
    // @Teardown
    func SplayTearDown() {
        // Allow the garbage collector to reclaim the memory
        // used by the splay tree no matter how we exit the
        // tear down function.
        let keys: ArrayList<Float64> = splayTree.getOrThrow().exportKeys()
        splayTree = Option<SplayTree>.None
        splaySamples = ArrayList<Float64>([])

        // Verify that the splay tree has the right size.
        let length: Int64 = keys.size
        if (length != kSplayTreeSize) {
            return 
        }

        // Verify that the splay tree has sorted, unique keys.
        for (i in 0..length - 1) {
            if (keys[i] >= keys[i + 1]) {
                return
            }
        }
    }
    // @Benchmark
    func SplayRun(): Unit {
        // Replace a few nodes in the splay tree.
        for (i in 0..kSplayTreeModifications) {
            let key: Float64 = InsertNewNode()
            let greatest: ?Node = splayTree.getOrThrow().findGreatestLessThan(key)
            if (greatest.isNone()) {
                splayTree.getOrThrow().remove(key)
            } else {
                splayTree.getOrThrow().remove((greatest.getOrThrow().key).getOrThrow())
            }
        }

        SplayUpdateStats(Float64(Timer().getTime()))
    }
}


class SplayTree {
    /**
     * Pointer to the root node of the tree.
     *
     * @type {SplayTree.Node}
     * @private
     */
    var root_: ?Node = None
    /**
     * @return {boolean} Whether the tree is empty.
     */
    func isEmpty(): Bool {
        return this.root_.isNone()
    }

    func insert(key: Float64, value: Object): Unit {
        if (this.isEmpty()) {
            this.root_ = Node(key, value)
            return
        }
        // Splay on the key to move the last node on the search path for
        // the key to the root of the tree.
        this.splay_(key)
        if (this.root_?.key == key) {
            return
        }
        let node: Node = Node(key, value)
        if (key > ((this.root_?.key).getOrThrow()).getOrThrow()) {
            node.left = this.root_
            node.right = (this.root_?.right).getOrThrow()
            this.root_?.right = None
        } else {
            node.right = this.root_
            node.left = (this.root_?.left).getOrThrow()
            this.root_?.left = None
        }
        this.root_ = node
    }

    func remove(key: Float64): ?Node {
        if (this.isEmpty()) {
            return Option<Node>.None
        }
        this.splay_(key)
        if (this.root_?.key != key) {
            return Option<Node>.None
        }
        let removed: ?Node = this.root_
        if ((this.root_?.left).getOrThrow().isNone()) {
            this.root_ = (this.root_?.right).getOrThrow()
        } else {
            let right: Option<Node> = (this.root_?.right).getOrThrow()
            this.root_ = (this.root_?.left).getOrThrow()
            // Splay to make sure that the new root has an empty right child.
            this.splay_(key)
            // Insert the original right child as the right child of the new root.
            this.root_?.right = right
        }
        
        return removed
    }

    func find(key: Float64): ?Node {
        if (this.isEmpty()) {
            return None
        }
        this.splay_(key)
        if ((this.root_?.key).getOrThrow() == key) {
            return this.root_
        } else {
            return None
        }
    }
    /**
     * @return {SplayTree.Node} Node having the maximum key value.
     */
    func findMax(opt_startNode!: ?Node = Option<Node>.None): ?Node {
        if (this.isEmpty()) {
            return None
        }
        var current: ?Node = opt_startNode ?? this.root_
        while (current.getOrThrow().right.isSome()) {
            current = current.getOrThrow().right
        }
        return current
    }
    /**
     * @return {SplayTree.Node} Node having the maximum key value that
     *     is less than the specified key value.
     */
    func findGreatestLessThan(key: Float64): ?Node {
        if (this.isEmpty()) {
            return None
        }
        // Splay on the key to move the node with the given key or the last
        // node on the search path to the top of the tree.
        this.splay_(key)
        // Now the result is either the root node or the greatest node in
        // the left subtree.
        if (this.root_.getOrThrow().key.getOrThrow() < key) {
            return this.root_
        } else if (this.root_.getOrThrow().left.isSome()) {
            return this.findMax(opt_startNode: this.root_.getOrThrow().left)
        } else {
            return None
        }
    }
    /**
     * @return {Array<*>} An array containing all the keys of tree's nodes.
     */
    func exportKeys(): ArrayList<Float64> {
        let result = ArrayList<Float64>([])
        if (!this.isEmpty()) {
            this.root_.getOrThrow().traverse_({node: Node => result.add((node.key).getOrThrow())})
        }
        return result
    }
  
    func splay_(key: Float64) {
        if (this.isEmpty()) {
            return
        }
        let dummy: ?Node = Node(0.0, 0.0)
        var left: ?Node = dummy
        var right: ?Node = dummy
        var current: Node = this.root_.getOrThrow()
        while (true) {
            if (key < current.key.getOrThrow()) {
                if (current.left.isNone()) {
                    break
                }
                if (key < (current.left.getOrThrow().key ?? 0.0)) {
                    // Rotate right.
                    let tmp: Node = (current.left).getOrThrow()
                    current.left = tmp.right
                    tmp.right = current
                    current = tmp
                    if (current.left.isNone()) {
                        break
                    }
                }
                // Link right.
                right.getOrThrow().left = current
                right = current
                current = current.left.getOrThrow()
            } else if (key > current.key.getOrThrow()) {
                if (current.right.isNone()) {
                    break
                }
                if (key > (current.right.getOrThrow().key ?? 0.0)) {
                    // Rotate left.
                    let tmp: Node = current.right.getOrThrow()
                    current.right = tmp.left
                    tmp.left = current
                    current = tmp
                    if (current.right.isNone()) {
                        break
                    }
                }
                // Link left;
                left.getOrThrow().right = current
                left = current
                current = current.right.getOrThrow()
            } else {
                break
            }
        }
        // Assemble.
        left?.right = current.left
        right?.left = current.right
        current.left = dummy.getOrThrow().right
        current.right = dummy.getOrThrow().left
        this.root_ = current
    }
}

/**
 * Constructs a Splay tree node.
 *
 * @param {number} key Key.
 * @param {*} value Value.
 */
class Node {
    var key: ?Float64
    var value: Any
    var left: ?Node = None
    var right: ?Node = None

    init(key: ?Float64, value: Any) {
        this.key = key
        this.value = value
    }
    /**
     * Performs an ordered traversal of the subtree starting at
     * this SplayTree.Node.
     *
     * @param {function(SplayTree.Node)} f Visitor function.
     * @private
     */
    func traverse_(f: ((Node) -> Unit)): Unit {
        var current: ?Node = this
        while (current.isSome()) {
            let left: ?Node = (current?.left).getOrThrow()
            if (left.isSome()) {
                left?.traverse_(f)
            }
            f(current.getOrThrow())
            current = (current?.right).getOrThrow()
        }
    }
}

func deBugLog(str: String) {
    let isLog = false
    if (isLog) {
        println(str)
    }
}
/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark{
    /*
   * @Benchmark
   */
    func SplayRunIteration() {
        let setupStart = Timer().start()
        let splay = Splay()
        splay.SplaySetup()
        let setupEnd = Timer().getTime()
        
        for (_ in 0..20) {
            for (_ in 0..50) {
                splay.SplayRun()
            }
        }
        splay.SplayTearDown()
        let splayEnd = Timer().stop()
        println("splay: ms = ${Float64((splayEnd - setupStart).toNanoseconds())/1000000.0}" )
    }
}

main() {
    Benchmark().SplayRunIteration()
}