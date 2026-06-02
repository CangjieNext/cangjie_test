// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 15.1.1 创建线程
// Create a thread.
let fut: Future<Int32> = spawn {
    add(1, 2)
}

// The return type of foo() is Int64.
let f1: Future<Int64> = spawn {
    foo()
}

// The return type of bar() is String.
let f2: Future<String> = spawn {
    bar()
}

// Waiting for the threads' execution results.
let r1: Int64 = f1.get()
let r2: String = f2.get()

// 15.1.3 Thread 类
main() {
    let fut: Future<Unit> = spawn {
        let tid = Thread.currentThread.id
        println("New thread id: ${tid}")
    }
    fut.get()
}

// 15.1.4 线程睡眠
func sleep(duration: Duration): Unit{}

// 15.1.5 线程终止
class Future<T> {
    // Send a termination request to its executing thread.
    public func cancel(): Unit
}

class Thread {
    // Check whether the thread has any cancellation request
    prop hasPendingCancellation: Bool
}

// 以下示例展示如何终止线程。
main(): Unit {
    let future = spawn { // Create a new thread
        while (true) {
            //...
            if (Thread.currentThread.hasPendingCancellation) {
                return // Terminate when having a request
            }
            //...
        }
    }

    //...
    future.cancel() // Send a termination request
    future.get() // Wait for thread termination
}

// 15.2.1 接口 ThreadContext
interface ThreadContext {
    func end(): Unit
    func hasEnded(): Bool
}

class ThreadLocal<T> {
    // Construct a thread-local variable contains None.
    public init(){}

    // Get the value of the thread-local variable of the current executing thread.
    public func get(): ?T

    // Set a value to the thread-local variable.
    public func set(value: ?T): Unit
}

// 以下示例展示如何使用线程局部变量。
let tlv = ThreadLocal<Int64>() // Define a thread-local variable

main(): Unit {
    for (i in 0..3) { // Spawn three threads
        spawn {
            tlv.set(i) // Each thread sets a different value

            // ...
            println("${tlv.get()}") // Each thread prints its own value
        }
    }
    // ...
    println("${tlv.get()}") // Print `None`
    // since the current thread does not set any value.
}

// 此外，对于可空引用类型，可以通过 AtomicOptionReference 保存 “空引用”（以 None 表示）。
class AtomicOptionReference<T> where T <: Object {
    public init(val: Option<T>){}
    public func load(): Option<T>
    public func store(val: Option<T>): Unit
    public func swap(val: Option<T>): Option<T>
    public func compareAndSwap(old: Option<T>, new: Option<T>): Bool
}

func sync1() {
    synchronized (obj) {
        while (true) {
            obj.wait();
        }
    }
}

func wait(timeout!: Duration = Duration.Max): Bool {}

let items: Array<Object> = Array<Object>(100, {i => Object()})

public func put(x: Object) {
    // Acquire the mutex.
    synchronized(m) {
        while (count == 100) {
            // If the queue is full, wait for the "queue notFull" event.
            m.wait(notFull)
        }
        items[head] = x
        head++
        if (head == 100) {
            head = 0
        }
        count++
        // An object has been inserted and the current queue is no longer
        // empty, so wake up the thread previously blocked on get()
        // because the queue was empty.
        m.notify(notEmpty)
    } // Release the mutex.
}

// Pop an object, if the queue is empty, block the current thread.
public func get(): Object {
    // Acquire the mutex.
    synchronized(m) {
        while (count == 0) {
            // If the queue is empty, wait for the "queue notEmpty" event.
            m.wait(notEmpty)
        }
        let x: Object = items[tail]
        tail++
        if (tail == 100) {
            tail = 0
        }
        count--
        // An object has been popped and the current queue is no longer
        // full, so wake up the thread previously blocked on put()
        // because the queue was full.
        m.notify(notFull)
        return x
    }
}
