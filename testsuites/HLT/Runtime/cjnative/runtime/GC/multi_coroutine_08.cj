/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

import std.random.*
import std.sync.*
import std.collection.*
import std.runtime.*
import std.argopt.*
import std.process

let re: ReentrantMutex = ReentrantMutex();
let FuNum: Int64 = 10000;

class Node {
    private var num: Int64
    private var Lchild: Option<Node>
    private var Rchild: Option<Node>

    public init(n: Int64) {
        this.num = n
        this.Lchild = Option<Node>.None
        this.Rchild = Option<Node>.None
    }

    public func insertL(node: Node): Unit {
        this.Lchild = Some(node)
    }

    public func insertR(node: Node): Unit {
        this.Rchild = Some(node)
    }

    public func insertLN(): Unit {
        this.Lchild = Option<Node>.None
    }

    public func insertRN(): Unit {
        this.Rchild = Option<Node>.None
    }

    public func getNum(): Int64 {
        return this.num;
    }

    public func getLchild(): Option<Node> {
        return this.Lchild;
    }

    public func getRchild(): Option<Node> {
        return this.Rchild;
    }
}

class BTree {
    private var root: Option<Node>

    public init(root: Node) {
        this.root = Some(root)
    }

    public func InsertNode(node: Node): Unit {
        let m: Random = Random();
        var temp: Option<Node> = root;
        while (true) {
            match (temp) {
                case Some(t) =>
                    let l: Bool = match (t.getLchild()) {
                        case Some(n) => true;
                        case None => false;
                    }
                    let r: Bool = match (t.getRchild()) {
                        case Some(n) => true;
                        case None => false;
                    }
                    if (m.nextBool()) {
                        if (l) {
                            temp = t.getLchild()
                        } else {
                            t.insertL(node);
                            return;
                        }
                    } else {
                        if (r) {
                            temp = t.getRchild()
                        } else {
                            t.insertR(node);
                            return;
                        }
                    }
                case None => return;
            }
        }
    }

    public func DeleteRandomNode(): Unit {
        let m: Bool = Random().nextBool();
        var temp: Option<Node> = this.root;
        var par: Option<Node> = None;
        var isLeft: Bool = true;
        while (true) {
            match (temp) {
                case Some(t) =>
                    let l: Bool = match (t.getLchild()) {
                        case Some(n) => true;
                        case None => false;
                    }
                    let r: Bool = match (t.getRchild()) {
                        case Some(n) => true;
                        case None => false;
                    }
                    if (l && r) {
                        par = temp
                        if (m) {
                            temp = t.getLchild()
                            isLeft = true
                        } else {
                            temp = t.getRchild()
                            isLeft = false
                        }
                        continue;
                    }
                    if (!l && !r) {
                        match (par) {
                            case Some(tt) =>
                                if (isLeft) {
                                    tt.insertLN();
                                } else {
                                    tt.insertRN();
                                }
                            case None => return;
                        }
                        return;
                    }
                    if (l) {
                        par = temp
                        temp = t.getLchild()
                        isLeft = true
                        continue;
                    }
                    if (r) {
                        par = temp
                        temp = t.getRchild()
                        isLeft = false
                        continue;
                    }
                case None => return;
            }
        }
    }

    private func CountNodeNum(node: Option<Node>): Int64 {
        var res: Int64 = 0;
        match (node) {
            case Some(n) =>
                res += n.getNum()
                res += CountNodeNum(n.getLchild())
                res += CountNodeNum(n.getRchild())
            case None => res += 0
        }
        return res;
    }

    public func CountTree(): Int64 {
        return CountNodeNum(this.root);
    }
}

main(): Int64 {
    let tree: BTree = BTree(Node(0));
    let FuList: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>(FuNum);
    for (i in 0..FuNum) {
        if (i < FuNum / 2) {
            FuList.add(spawn {
                synchronized(re) {
                    tree.InsertNode(Node(1));
                }
            })
        } else {
            FuList.add(spawn {
                synchronized(re) {
                    tree.DeleteRandomNode();
                }
            })
        }
    }
    for (i in 0..FuNum) {
        try {
            FuList[i].get();
        } catch (e: Exception) {
            print("exception, ${i}");
        }
    }
    print("success");
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0;
}
