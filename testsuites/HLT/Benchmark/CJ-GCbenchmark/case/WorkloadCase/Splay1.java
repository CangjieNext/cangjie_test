/*test
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.util.function.Consumer;

class SplayData {
    public final static int SPLAY_8000 = 8000;
    public final static int SPLAY_80 = 80;
    public final static int SPLAY_5 = 5;
    public final static int SPLAY_2 = 2;
    public final static int SPLAY_3 = 3;
    public final static int SPLAY_4 = 4;
    public final static int SPLAY_6 = 6;
    public final static int SPLAY_7 = 7;
    public final static int SPLAY_8 = 8;
    public final static int SPLAY_9 = 9;
    public final static int SPLAY_120 = 20;
    public final static int SPLAY_50 = 50;
    public final static int SPLAY_20 = 20;
    public final static int SPLAY_19 = 19;
    public final static int SPLAY_TIME = 1000000;
    public final static int ONE_MILLION = 1000000;
}

class Performance {
    public static double now() {
        return (double)System.nanoTime() / SplayData.ONE_MILLION;
    }
}

class PayloadTree0 {
    public Number[] array;
    public String str;

    PayloadTree0(Number[] array, String str) {
        this.array = array;
        this.str = str;
    }
}

class PayloadTreeDepth {
    public Object left;
    public Object right;

    PayloadTreeDepth(Object left, Object right) {
        this.left = left;
        this.right = right;
    }
}

class Splay {
    // Configuration.
    public SplayTree splayTree = new SplayTree();
    public double splaySampleTimeStart = 0.0;
    public ArrayList<Number> splaySamples = new ArrayList<Number>();

    public Object generatePayloadTree(int depth, double tag) {
        if (depth == 0) {
            Number[] arr = { 0, 1,
                    SplayData.SPLAY_2,
                    SplayData.SPLAY_3,
                    SplayData.SPLAY_4,
                    SplayData.SPLAY_5,
                    SplayData.SPLAY_6,
                    SplayData.SPLAY_7,
                    SplayData.SPLAY_8,
                    SplayData.SPLAY_9,
            };
            return new PayloadTree0(arr, "String for key" + tag + "in leaf node");
        } else {
            return new PayloadTreeDepth(generatePayloadTree(depth - 1, tag), generatePayloadTree(depth - 1, tag));
        }
    }

    public double generateKey() {
        // The benchmark framework guarantees that Math.random is
        // deterministic; see base.js.
        return Math.random();
    }

    public void splayUpdateStats(double time) {
        final double pause = time - this.splaySampleTimeStart;
        this.splaySampleTimeStart = time;
        splaySamples.add(pause);
    }

    public double insertNewNode() {
        // Insert new node with a unique key.
        double key;
        do {
            key = this.generateKey();
        } while (this.splayTree != null && this.splayTree.find(key) != null);
        final Object payload = this.generatePayloadTree(SplayData.SPLAY_5, key);
        this.splayTree.insert(key, payload);
        return key;
    }

    /*
     * @Setup
     */
    public void splaySetup() {
		// Check if the platform has the performance.now high resolution timer.
  	    // If not, throw exception and quit.
        if (Performance.now() == 0.0) {
            // Splays.deBugLog("PerformanceNowUnsupported")
            return;
        }
        this.splayTree = new SplayTree();
        this.splaySampleTimeStart = Performance.now();
        for (int i = 0; i < SplayData.SPLAY_8000; i++) {
            double key = this.insertNewNode();
            // Splays.deBugLog("This is InsertNewNode key: " + key);
            if ((i + 1) % SplayData.SPLAY_20 == SplayData.SPLAY_19) {
                this.splayUpdateStats(Performance.now());
            }
        }
    }

    /*
     * @Teardown
     */
    public void splayTearDown() {
        // Allow the garbage collector to reclaim the memory
        // used by the splay tree no matter how we exit the
        // tear down function.
        final Double[] keys = splayTree.exportKeys();
        this.splayTree = null;
        splaySamples = new ArrayList<Number>();
        // Verify that the splay tree has the right size.
        final int length = keys.length;
        if (length != SplayData.SPLAY_8000) {
            return;
        }
        // Verify that the splay tree has sorted, unique keys.
        for (int i = 0; i < length - 1; i++) {
            if (keys[i] >= keys[i + 1]) {
                return;
            }
        }
    }

    /*
     * @Splay1
     */
    public void splayRun() {
        // Replace a few nodes in the splay tree.
        for (int i = 0; i < SplayData.SPLAY_80; i++) {
            final double key = this.insertNewNode();
            // Splays.deBugLog("This is SplayRun input Node key: " + key);
            final Node greatest = this.splayTree.findGreatestLessThan(key);
            // Splays.deBugLog("This is SplayRun output greatest Node key: " + greatest.key);
            if (greatest == null) {
                this.splayTree.remove(key);
            } else {
                // Splays.deBugLog("This is SplayRun output remove Node key: " + greatest.key);
                this.splayTree.remove(greatest.key);
            }
        }
        this.splayUpdateStats(Performance.now());
    }
}


class SplayTree {
    /**
     * Pointer to the root node of the tree.
     *
     * @type {SplayTree.Node}
     * @private
     */
    public Node root = null;

    /**
     * @return {boolean} Whether the tree is empty.
     */
    public boolean isEmpty() {
        return this.root == null;
    }

    /**
     ** Inserts a node into the tree with the specified key and value if
     ** the tree does not already contain a node with the specified key. If
     ** the value is inserted, it becomes the root of the tree.
     *
     ** @param {number} key Key to insert into the tree.
     ** @param {*}      value Value to insert into the tree.
     **/
    public void insert(double key, Object value) {
        if (this.isEmpty()) {
            this.root = new Node(key, value);
            return;
        }
        // Splay on the key to move the last node on the search path for
        // the key to the root of the tree.
        this.splay(key);
        if (this.root != null && this.root.key == key) {
            return;
        }
        Node node = new Node(key, value);
        if (key > this.root.key) {
            node.left = this.root;
            node.right = this.root.right;
            this.root.right = null;
        } else {
            node.right = this.root;
            node.left = this.root.left;
            this.root.left = null;
        }
        this.root = node;
    }


    public Node remove(double key) {
        if (this.isEmpty()) {
            return null;
        }
        this.splay(key);
        if (this.root.key != key) {
            return null;
        }
        final Node removed = this.root;
        if (this.root.left == null) {
            this.root = this.root.right;
        } else {
            final Node right = this.root.right;
            this.root = this.root.left;
            // Splay to make sure that the new root has an empty right child.
            this.splay(key);
            // Insert the original right child as the right child of the new root.
            this.root.right = right;
        }
        return removed;
    }


    public Node find(double key) {
        if (this.isEmpty()) {
            return null;
        }
        this.splay(key);
        return (this.root != null && this.root.key == key) ? this.root : null;
    }

    /**
     * @return {SplayTree.Node} Node having the maximum key value.
     */
    public Node findMax(Node optStartNode) {
        if (this.isEmpty()) {
            return null;
        }
        Node current = optStartNode != null ? optStartNode : this.root;
        while (current.right != null) {
            current = current.right;
        }
        return current;
    }

    /**
     * @return {SplayTree.Node} Node having the maximum key value that
     *         is less than the specified key value.
     */
    public Node findGreatestLessThan(double key) {
        if (this.isEmpty()) {
            return null;
        }
        // Splay on the key to move the node with the given key or the last
        // node on the search path to the top of the tree.
        this.splay(key);
        // Now the result is either the root node or the greatest node in
        // the left subtree.
        if (this.root.key < key) {
            return this.root;
        } else if (this.root.left != null) {
            return this.findMax(this.root.left);
        } else {
            return null;
        }
    }

    /**
     * @return {Array<*>} An array containing all the keys of tree's nodes.
     */
    public Double[] exportKeys() {
        final ArrayList<Number> result = new ArrayList<Number>();
        if (!this.isEmpty()) {
            this.root.traverse(node -> {
                result.add(node.key);
            });
        }
        return result.toArray(new Double[0]);
    }

    /**
     ** Perform the splay operation for the given key. Moves the node with
     ** the given key to the top of the tree. If no node has the given
     ** key, the last node on the search path is moved to the top of the
     ** tree. This is the simplified top-down splaying algorithm from:
     ** "Self-adjusting Binary Search Trees" by Sleator and Tarjan
     *
     ** @param {number} key Key to splay the tree on.
     ** @private
     **/
    public void splay(double key) {
        if (this.isEmpty()) {
            return;
        }
        Node dummy;
        Node left;
        Node right;
        dummy = new Node(0, null);
        left = dummy;
        right = dummy;
        Node current = this.root;

        while (true) {
            if (key < current.key) {
                if (current.left == null) {
                    break;
                }
                if (key < current.left.key) {
                    Node temp = current.left;
                    current.left = temp.right;
                    temp.right = current;
                    current = temp;
                    if (current.left == null) {
                        break;
                    }
                }
                right.left = current;
                right = current;
                current = current.left;
            } else if (key > current.key) {
                if (current.right == null) {
                    break;
                }
                if (key > current.right.key) {
                    Node temp = current.right;
                    current.right = temp.left;
                    temp.left = current;
                    current = temp;
                    if (current.right == null) {
                        break;
                    }
                }
                left.right = current;
                left = current;
                current = current.right;
            } else {
                break;
            }
        }
        // Assemble.
        left.right = current.left;
        right.left = current.right;
        current.left = dummy.right;
        current.right = dummy.left;
        this.root = current;
    }
}

/**
 * Constructs a Splay tree node.
 *
 * @param {number} key Key.
 * @param {*}      value Value.
 */
class Node {
    public double key;
    public Object value;
    public Node left;
    public Node right;

    Node(double key, Object value) {
        this.key = key;
        this.value = value;
        this.right = null;
        this.left = null;
    }

    /**
     * Performs an ordered traversal of the subtree starting at
     * this SplayTree.Node.
     *
     * @param {function(SplayTree.Node)} f Visitor function.
     * @private
     */
    public void traverse(Consumer<Node> f) {
        Splays.traverseSub(this, f);
    }
}

class Splays {

    public static void traverseSub(Node current, Consumer<Node> f) {
        while (current != null) {
            Node left = current.left;
            if (left != null) {
                left.traverse(f);
            }
            f.accept(current);
            current = current.right;
        }
    }

    public static void deBugLog(String str) {
        boolean isLog = false;
        if (isLog) {
            System.out.println(str);
        }
    }

    public static void splayRunIteration() {
        double setupStart = Performance.now();
        Splay splay = new Splay();
        splay.splaySetup();
        double setupEnd = Performance.now();
        // deBugLog("setupTime: " + (setupEnd - setupStart) + "ms");
        for (int i = 0; i < SplayData.SPLAY_120; ++i) {
            for (int j = 0; j < SplayData.SPLAY_50; ++j) {
                splay.splayRun();
            }
        }
        splay.splayTearDown();
        double splayEnd = Performance.now();
        System.out.println("Splay1: ms = " + (splayEnd - setupStart));
    }
}

class Splay1 {
    public static void main(String[] args) {
        Splays.splayRunIteration();
    }
}