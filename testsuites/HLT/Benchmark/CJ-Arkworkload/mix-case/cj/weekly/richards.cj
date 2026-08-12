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
import std.math.*

let isDebug : Bool = false
func DeBugLog(msg: String){
    if (isDebug) {
        let prefix = "${msg}"
        println(prefix)
    }
}

var ID_IDLE = 0
var ID_WORKER = 1
var ID_HANDLER_A = 2
var ID_HANDLER_B = 3
var ID_DEVICE_A = 4
var ID_DEVICE_B = 5
var NUMBER_OF_IDS = 6
var KIND_DEVICE = 0
var KIND_WORK = 1


var STATE_RUNNING = 0;


var STATE_RUNNABLE = 1;


var STATE_SUSPENDED = 2;


var STATE_HELD = 4;

var STATE_SUSPENDED_RUNNABLE = STATE_SUSPENDED | STATE_RUNNABLE;
var STATE_NOT_HELD = !STATE_HELD;
var DATA_SIZE = 4;
var COUNT = 1000;

/**
 ** These two constants specify how many times a packet is queued and
 ** how many times a task is put on hold in a correct run of richards.
 ** They don't have any meaning a such but are characteristic of a
 ** correct run so if the actual queue or hold count is different from
 ** the expected there must be a bug in the implementation.
 **/
var EXPECTED_QUEUE_COUNT = 2322;
var EXPECTED_HOLD_COUNT = 928;

// cangjie 不支持 class 嵌套

/// @Generator
/// Base classes for different task types
interface Task {
    func run(packet: ?Packet): ?TaskControlBlock
}

class IdleTask <: Task {
    var scheduler: Scheduler
    var v1: Int64
    var count: Int64

    /// An idle task doesn't do any work itself but cycles control between the two device tasks.
    /// - Parameters:
    ///   - scheduler: the scheduler that manages this task
    ///   - v1: a seed value that controls how the device tasks are scheduled
    ///   - count: the number of times this task should be scheduled
    init(scheduler: Scheduler, v1: Int64, count: Int64) {
        this.scheduler = scheduler
        this.v1 = v1
        this.count = count
    }
    
    public func run(packet: ?Packet): ?TaskControlBlock {
        this.count -= 1
        if (this.count == 0) {
            return this.scheduler.holdCurrent()
        }
        if ((this.v1 & 1) == 0) {
            this.v1 = this.v1 >> 1
            // release ID_DEVICE_A
            return this.scheduler.release(ID_DEVICE_A)
        } else {
            this.v1 = (this.v1 >> 1) ^ 0xD008
            // release ID_DEVICE_B
            return this.scheduler.release(ID_DEVICE_B)
        }
    }
    
    func toString(): String {
        return "IdleTask"
    }
}

class WorkerTask <:Task {
    var scheduler: Scheduler
    var v1: Int64
    var v2: Int64
    
    /// A task that manipulates work packets.
    /// - Parameters:
    ///   - scheduler: the scheduler that manages this task
    ///   - v1:  a seed used to specify how work packets are manipulated
    ///   - v2: another seed used to specify how work packets are manipulated
    init(scheduler: Scheduler, v1: Int64, v2: Int64) {
        this.scheduler = scheduler
        this.v1 = v1
        this.v2 = v2
    }
    
    public func run(packet: ?Packet): ?TaskControlBlock {
        if (packet.isNone()) {
            return this.scheduler.suspendCurrent()
        } else {
            if (this.v1 == ID_HANDLER_A) {
                this.v1 = ID_HANDLER_B
            } else {
                this.v1 = ID_HANDLER_A
            }
            packet.getOrThrow().id = this.v1
            packet.getOrThrow().a1 = 0
            for (i in 0..DATA_SIZE) {
                this.v2 += 1
                if (this.v2 > 26) {
                    this.v2 = 1
                }
                packet.getOrThrow().a2[i] = this.v2
            }
            return this.scheduler.queue(packet.getOrThrow())
        }
    }
    
    func toString(): String {
        return "WorkerTask"
    }
}

class HandlerTask <: Task {
    var scheduler: Scheduler
    var v1: ?Packet
    var v2: ?Packet

    init(scheduler: Scheduler) {
        this.scheduler = scheduler
        this.v1 = Option<Packet>.None
        this.v2 = Option<Packet>.None
    }
    
    /// A task that manipulates work packets and then suspends itself.
    /// - Parameter packet: the scheduler that manages this task
    /// - Returns: TaskControlBlock
    public func run(packet: ?Packet): ?TaskControlBlock {
        if (packet.isSome()) {
            if (packet.getOrThrow().kind == KIND_WORK) {
                this.v1 = packet.getOrThrow().addTo(this.v1)
            } else {
                this.v2 = packet.getOrThrow().addTo(this.v2)
            }
        }
        
        if (this.v1.isSome()) {
            let count = v1.getOrThrow().a1
            var v: ?Packet
            if (count < DATA_SIZE) {
                if (this.v2.isSome()) {
                    v = this.v2
                    this.v2 = this.v2.getOrThrow().link
                    v.getOrThrow().a1 = this.v1.getOrThrow().a2[count]
                    this.v1.getOrThrow().a1 = count + 1
                    return this.scheduler.queue(v.getOrThrow())
                }
            } else {
                v = this.v1
                this.v1 = this.v1.getOrThrow().link
                return this.scheduler.queue(v.getOrThrow())
            }
        }
        
        return this.scheduler.suspendCurrent()
    }
    
    func toString(): String {
        return "HandlerTask"
    }
}

class DeviceTask <: Task {
    var scheduler: Scheduler
    var v1: ?Packet
    
    init(scheduler: Scheduler) {
        this.scheduler = scheduler
        this.v1 = Option<Packet>.None
    }
    
    /// A task that suspends itself after each time it has been run to simulate waiting for data from an external device.
    /// - Parameter packet: the scheduler that manages this task
    /// - Returns: TaskControlBlock
    public func run(packet: ?Packet): ?TaskControlBlock {
        if (packet.isNone()) {
            if (this.v1.isNone()) {
                return this.scheduler.suspendCurrent()
            }
            let v = this.v1
            this.v1 = Option<Packet>.None
            return this.scheduler.queue(v.getOrThrow())
        } else {
            this.v1 = packet
            return this.scheduler.holdCurrent()
        }
    }
    
    func toString(): String {
        return "DeviceTask"
    }
}

class Packet {
    var link: ?Packet
    var id: Int64
    var kind: Int64
    var a1: Int64
    var a2: Array<Int64>
    
    /// A simple package of data that is manipulated by the tasks.  The exact layout
    /// of the payload data carried by a packet is not importaint, and neither is the
    /// nature of the work performed on packets by the tasks.
    /// - Parameters:
    ///   - link: the tail of the linked list of packets
    ///   - id: an ID for this packet
    ///   - kind: the type of this packet
    init(link: ?Packet, id: Int64, kind: Int64) {
        this.link = link
        this.id = id
        this.kind = kind
        this.a1 = 0
        this.a2 = Array<Int64>(DATA_SIZE, { x:Int64 => 0})
    }
    
    /// Add this packet to the end of a worklist, and return the worklist.
    /// - Parameter queue: the worklist to add this packet to
    /// - Returns: Packet
    func addTo(queue: ?Packet): Packet {
        this.link = Option<Packet>.None
        if (queue.isNone()) {
            return this
        }
        var peek: ?Packet
        var next = queue
        while (let current <- next) {
            peek = current.getOrThrow().link
            if (peek.isNone()) {
                break
            }
            next = peek
        }
        next.getOrThrow().link = this
        return queue.getOrThrow()
    }
    
    func toString(): String {
        return "Packet"
    }
}

class TaskControlBlock {
    var link: ?TaskControlBlock
    var id: Int64
    var priority: Int64
    var queue: ?Packet
    var task: Task
    var state: Int64
    
   
    init(link: ?TaskControlBlock, id: Int64, priority: Int64, queue: ?Packet, task: Task) {
        this.link = link
        this.id = id
        this.priority = priority
        this.queue = queue
        this.task = task
        if (queue.isNone()) {
            this.state = STATE_SUSPENDED
        } else {
            this.state = STATE_SUSPENDED_RUNNABLE
        }
    }
    
    func setRunning() {
        this.state = STATE_RUNNING
    }
    
    func markAsNotHeld() {
        this.state = this.state & STATE_NOT_HELD
    }
    
    func markAsHeld() {
        this.state = this.state | STATE_HELD
    }
    
    func isHeldOrSuspended(): Bool {
        return (this.state & STATE_HELD) != 0 || (this.state == STATE_SUSPENDED)
    }
    
    func markAsSuspended() {
        this.state = this.state | STATE_SUSPENDED
    }
    
    func markAsRunnable() {
        this.state = this.state | STATE_RUNNABLE
    }
    
    /// Runs this task, if it is ready to be run, and returns the next task to run.
    func run(): ?TaskControlBlock {
        var packet: ?Packet
        if (this.state == STATE_SUSPENDED_RUNNABLE) {
            packet = this.queue
            this.queue = packet.getOrThrow().link
            if (queue.isNone()) {
                //queue is empty, set state STATE_RUNNING
                this.state = STATE_RUNNING
            } else {
                //queue not empty, set state STATE_RUNNABLE
                this.state = STATE_RUNNABLE
            }
        } else {
            packet = Option<Packet>.None
        }
        return this.task.run(packet)
    }

    /// Adds a packet to the worklist of this block's task, marks this as runnable if
    /// necessary, and returns the next runnable object to run (the one
    /// with the highest priority).  
    func checkPriorityAdd(taskControlBlock: TaskControlBlock, packet: Packet): ?TaskControlBlock {
        if (queue.isNone()) {
            this.queue = packet
            this.markAsRunnable()
            if (this.priority > taskControlBlock.priority) {
                return this
            }
        } else {
            this.queue = packet.addTo(queue.getOrThrow())
        }
        return taskControlBlock
    }
    
    func toString(): String {
        return "tcb { @${state} }"
    }
}

/// A scheduler can be used to schedule a set of tasks based on their relative
/// priorities.  Scheduling is done by maintaining a list of task control blocks
/// which holds tasks and the data queue they are processing.
class Scheduler {
    var queueCount: Int64
    var holdCount: Int64
    var blocks: Array<?TaskControlBlock> 
    var list: ?TaskControlBlock
    var currentTcb: ?TaskControlBlock
    var currentId: ?Int64
    
    init() {
        this.queueCount = 0
        this.holdCount = 0
        this.blocks = Array<?TaskControlBlock>(NUMBER_OF_IDS, { x:Int64 => Option<TaskControlBlock>.None})
        this.list = Option<TaskControlBlock>.None
        this.currentTcb = Option<TaskControlBlock>.None
        this.currentId = Option<Int64>.None
    }
    
    /// Add an idle task to this scheduler.
    /// - Parameters:
    ///   - id: the identity of the task
    ///   - priority: the task's priority
    ///   - queue: the queue of work to be processed by the task
    ///   - count: the number of times to schedule the task
    func addIdleTask(id: Int64, priority: Int64, queue: ?Packet, count: Int64) {
        this.addRunningTask(id, priority, queue, IdleTask(this, 1, count))
    }
    
    /// Add a work task to this scheduler.
    /// - Parameters:
    ///   - id: the identity of the task
    ///   - priority: the task's priority
    ///   - queue: the queue of work to be processed by the task
    func addWorkerTask(id: Int64, priority: Int64, queue: Packet) {
        this.addTask(id, priority, queue, WorkerTask(this, ID_HANDLER_A, 0))
    }
    
    /// Add a handler task to this scheduler.
    /// - Parameters:
    ///   - id: the identity of the task
    ///   - priority: the task's priority
    ///   - queue: the queue of work to be processed by the task
    func addHandlerTask(id: Int64, priority: Int64, queue: Packet) {
        this.addTask(id, priority, queue, HandlerTask(this))
    }
    
    /// Add a handler task to this scheduler.
    /// - Parameters:
    ///   - id: the identity of the task
    ///   - priority: the task's priority
    ///   - queue: the queue of work to be processed by the task
    func addDeviceTask(id: Int64, priority: Int64, queue: ?Packet) {
        this.addTask(id, priority, queue, DeviceTask(this))
    }
    
    /// Add the specified task and mark it as running.
    /// - Parameters:
    ///   - id: the identity of the task
    ///   - priority: the task's priority
    ///   - queue: the queue of work to be processed by the task
    ///   - task: the task to add
    func addRunningTask(id: Int64, priority: Int64, queue: ?Packet, task: Task) {
        this.addTask(id, priority, queue, task)
        this.currentTcb.getOrThrow().setRunning()
    }
    
    /// Add the specified task to this scheduler.
    /// - Parameters:
    ///   - id: the identity of the task
    ///   - priority: the task's priority
    ///   - queue: the queue of work to be processed by the task
    ///   - task: the task to add
    func addTask(id: Int64, priority: Int64, queue: ?Packet, task: Task) {
        this.currentTcb = TaskControlBlock(list, id, priority, queue, task)
        this.list = this.currentTcb
        this.blocks[id] = this.currentTcb
    }
    
    /// Block the currently executing task and return the next task control block
    /// to run.  The blocked task will not be made runnable until it is explicitly
    /// released, even if new work is added to it.
    func holdCurrent(): ?TaskControlBlock {
        this.holdCount += 1
        this.currentTcb.getOrThrow().markAsHeld()
        return this.currentTcb.getOrThrow().link
    }
    
    /// Suspend the currently executing task and return the next task control block
    /// to run.  If new work is added to the suspended task it will be made runnable.
    func suspendCurrent(): ?TaskControlBlock {
        this.currentTcb.getOrThrow().markAsSuspended()
        return this.currentTcb
    }
    
    /// Add the specified packet to the end of the worklist used by the task
    /// associated with the packet and make the task runnable if it is currently suspended.
    /// - Parameter packet: the packet to add
    /// - Returns: TaskControlBlock
    func queue(packet: Packet): ?TaskControlBlock {
        let t = blocks[packet.id]
        if (t.isNone()) { return t }
        this.queueCount += 1
        packet.link = Option<Packet>.None
        packet.id = currentId.getOrThrow()
        return t.getOrThrow().checkPriorityAdd(currentTcb.getOrThrow(), packet)
    }
    
    /// Execute the tasks managed by this scheduler.
    func schedule() {
        this.currentTcb = this.list
        while (this.currentTcb.isSome()) {
            if (this.currentTcb.getOrThrow().isHeldOrSuspended()) {
                this.currentTcb = this.currentTcb.getOrThrow().link
            } else {
                this.currentId = this.currentTcb.getOrThrow().id
                this.currentTcb = this.currentTcb.getOrThrow().run()
            }
        }
    }
    
    /// Release a task that is currently blocked and return the next block to run.
    /// - Parameter id: the id of the task to suspend
    /// - Returns: TaskControlBlock
    func release(id: Int64): ?TaskControlBlock {
        let tcb = this.blocks[id]
        if (tcb.isNone()) { return tcb }
        tcb.getOrThrow().markAsNotHeld()
        if (tcb.getOrThrow().priority > currentTcb.getOrThrow().priority) {
            return tcb
        } else {
            return currentTcb
        }
    }
}

/// The Richards benchmark simulates the task dispatcher of an operating system.
func runRichards() {
    let scheduler = Scheduler()
    scheduler.addIdleTask(ID_IDLE, 0, Option<Packet>.None, COUNT)
    
    var queue = Packet(Option<Packet>.None, ID_WORKER, KIND_WORK)
    queue = Packet(queue, ID_WORKER, KIND_WORK)
    scheduler.addWorkerTask(ID_WORKER, 1000, queue)
    //create DEVICE_A Packet
    queue = Packet(Option<Packet>.None, ID_DEVICE_A, KIND_DEVICE)
    queue = Packet(queue, ID_DEVICE_A, KIND_DEVICE)
    queue = Packet(queue, ID_DEVICE_A, KIND_DEVICE)
    scheduler.addHandlerTask(ID_HANDLER_A, 2000, queue)
    //create DEVICE_B Packet
    queue = Packet(Option<Packet>.None, ID_DEVICE_B, KIND_DEVICE)
    queue = Packet(queue, ID_DEVICE_B, KIND_DEVICE)
    queue = Packet(queue, ID_DEVICE_B, KIND_DEVICE)
    scheduler.addHandlerTask(ID_HANDLER_B, 3000, queue)
    // add task ID_DEVICE_A
    scheduler.addDeviceTask(ID_DEVICE_A, 4000, Option<Packet>.None)
    // add task ID_DEVICE_B
    scheduler.addDeviceTask(ID_DEVICE_B, 5000, Option<Packet>.None)
    
    scheduler.schedule()
    // status check
    if (scheduler.queueCount != EXPECTED_QUEUE_COUNT || scheduler.holdCount != EXPECTED_HOLD_COUNT) {
        let msg = "Error during execution: queueCount = ${scheduler.queueCount}, holdCount = ${scheduler.holdCount}."
        
    }
    
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
class BenchMark{
    /*
   * @Benchmark
   */
    func runIterationTime() {
        let start = Timer().getTime()
        
        for (_ in 0..20) {
            for (_ in 0..50) {
                runRichards()
            }
        }
        let end = Timer().getTime()
        let duration = end - start
        println("richards: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
    }
}

main() {
    BenchMark().runIterationTime()
}
