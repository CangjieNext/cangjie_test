/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_blockingqueue;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

// _Event 接口
interface _Event {
    boolean isExit();
    _Event clone();
    String name();
}

// _IntEvent 实现
class _IntEvent implements _Event {
    private long value;

    public _IntEvent(long value) {
        this.value = value;
    }

    @Override
    public boolean isExit() {
        return value == -1;
    }

    @Override
    public _Event clone() {
        return new _IntEvent(this.value);
    }

    @Override
    public String name() {
        return "int";
    }
}

// _StrEvent 实现
class _StrEvent implements _Event {
    private String value;

    public _StrEvent(long size) {
        if (size <= 0) {
            this.value = "";
        } else {
            StringBuilder sb = new StringBuilder((int)size);
            for (int i = 0; i < size; i++) {
                sb.append('A');
            }
            this.value = sb.toString();
        }
    }

    public _StrEvent(String value) {
        this.value = value;
    }

    @Override
    public boolean isExit() {
        return "exit".equals(value);
    }

    @Override
    public _Event clone() {
        return new _StrEvent(this.value);
    }

    @Override
    public String name() {
        return "str";
    }
}

// StrCloneEvent 实现
class StrCloneEvent implements _Event {
    private String value;

    public StrCloneEvent(long size) {
        if (size <= 0) {
            this.value = "";
        } else {
            StringBuilder sb = new StringBuilder((int)size);
            for (int i = 0; i < size; i++) {
                sb.append('A');
            }
            this.value = sb.toString();
        }
    }

    public StrCloneEvent(String value) {
        this.value = value;
    }

    @Override
    public boolean isExit() {
        return "exit".equals(value);
    }

    @Override
    public _Event clone() {
        // 创建字符串的深拷贝
        return new StrCloneEvent(new String(this.value));
    }

    @Override
    public String name() {
        return "str_clone";
    }
}

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkLinkedBlockingQueue_class {
    // 创建事件实例
    private _Event newEvent(int eventType, long eventSize) {
        if (eventType == 0) {
            return new _IntEvent(eventSize);
        } else if (eventType == 1) {
            return new _StrEvent(eventSize);
        } else {
            return new StrCloneEvent(eventSize);
        }
    }

    // Worker 实现
    private void worker(
            LinkedBlockingQueue<_Event> queue,
            LinkedBlockingQueue<Long> doneQueue,
            long target
    ) {
        long count = 0;
        try {
            for (long i = 0; i < target; i++) {
                _Event event = queue.take();
                if (!event.isExit()) {
                    count++;
                }
            }
            doneQueue.put(count);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    // Dispatch 实现
    private void dispatchTo(_Event event, long count, LinkedBlockingQueue<_Event> addr) {
        try {
            for (long i = 0; i < count; i++) {
                addr.put(event.clone());
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    // 基准测试主方法
    private void runBenchmark(long workers, long events, int eventType,
                              long eventSize, long queueSize, Blackhole bh) {
        // 初始化线程池和队列
        ExecutorService executor = Executors.newFixedThreadPool((int) (workers * 2));
        List<LinkedBlockingQueue<_Event>> address = new ArrayList<>();
        LinkedBlockingQueue<Long> done = new LinkedBlockingQueue<>((int) workers);

        // 创建worker队列
        for (int i = 0; i < workers; i++) {
            address.add(new LinkedBlockingQueue<_Event>((int) queueSize));
        }

        // 创建基础事件
        _Event baseEvent = newEvent(eventType, eventSize);

        try {
            // 启动workers
            for (int i = 0; i < workers; i++) {
                LinkedBlockingQueue<_Event> queue = address.get(i);
                executor.submit(() -> worker(queue, done, events));
            }

            // 启动dispatchers
            for (int i = 0; i < workers; i++) {
                LinkedBlockingQueue<_Event> addr = address.get(i);
                executor.submit(() -> dispatchTo(baseEvent, events, addr));
            }

            // 等待所有任务完成
            long totalEvents = 0;
            for (int i = 0; i < workers; i++) {
                totalEvents += done.take();
            }

            bh.consume(totalEvents); // 防止优化
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            executor.shutdownNow();
        }
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_SingleWorker_IntEvent(Blackhole bh) {
        runBenchmark(1, 10000, 0, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_SingleWorker_StrEvent(Blackhole bh) {
        runBenchmark(1, 10000, 1, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_Worker_N8(Blackhole bh) {
        runBenchmark(8, 100000, 0, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_Worker_N16(Blackhole bh) {
        runBenchmark(16, 100000, 1, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_Worker_N32(Blackhole bh) {
        runBenchmark(32, 100000, 2, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_Worker_N64(Blackhole bh) {
        runBenchmark(64, 100000, 1, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_EventSize_S8(Blackhole bh) {
        runBenchmark(8, 100000, 0, 8, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_EventSize_S1024(Blackhole bh) {
        runBenchmark(8, 100000, 1, 1024, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_EventSize_S65536(Blackhole bh) {
        runBenchmark(8, 100000, 2, 65536, 64, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_QueueSize_N16(Blackhole bh) {
        runBenchmark(8, 100000, 0, 64, 16, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_QueueSize_N256(Blackhole bh) {
        runBenchmark(8, 100000, 1, 64, 256, bh);
    }

    @Benchmark
    public void BenchmarkLinkedBlockingQueue_class_QueueSize_N1024(Blackhole bh) {
        runBenchmark(8, 100000, 2, 64, 1024, bh);
    }
    
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedBlockingQueue_class.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
