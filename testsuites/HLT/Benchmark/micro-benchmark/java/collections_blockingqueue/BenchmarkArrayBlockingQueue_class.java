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
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

interface Event {
    boolean isExit();
    String name();
    Event clone();
}

class IntEvent implements Event {
    private long value;

    public IntEvent(long value) {
        this.value = value;
    }

    @Override
    public boolean isExit() {
        return value == -1;
    }

    @Override
    public String name() {
        return "int";
    }

    @Override
    public Event clone() {
        return new IntEvent(this.value);
    }
}

class StrEvent implements Event {
    private String value;

    public StrEvent(long size) {
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

    public StrEvent(String value) {
        this.value = value;
    }

    @Override
    public boolean isExit() {
        return "exit".equals(value);
    }

    @Override
    public String name() {
        return "str";
    }

    @Override
    public Event clone() {
        return new StrEvent(this.value);
    }
}

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayBlockingQueue_class {
    // 基准测试辅助方法
    private void runBenchmark(long workers, long events, int eventType,
                              long eventSize, long queueSize, Blackhole bh) {
        // 创建基础事件
        Event baseEvent;
        if (eventType == 0) {
            baseEvent = new IntEvent(eventSize);
        } else {
            baseEvent = new StrEvent(eventSize);
        }

        // 初始化队列和线程池
        ExecutorService executor = Executors.newFixedThreadPool((int) (workers * 2));
        List<ArrayBlockingQueue<Event>> address = new ArrayList<ArrayBlockingQueue<Event>>();
        ArrayBlockingQueue<Long> done = new ArrayBlockingQueue<Long>((int) workers);

        // 创建worker队列
        for (int i = 0; i < workers; i++) {
            address.add(new ArrayBlockingQueue<Event>((int) queueSize));
        }

        try {
            // 启动workers
            for (int i = 0; i < workers; i++) {
                ArrayBlockingQueue<Event> queue = address.get(i);
                executor.submit(() -> worker(queue, done, events));
            }

            // 启动dispatchers
            for (int i = 0; i < workers; i++) {
                ArrayBlockingQueue<Event> addr = address.get(i);
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

    private void worker(
            ArrayBlockingQueue<Event> queue,
            ArrayBlockingQueue<Long> doneQueue,
            long target
    ) {
        long count = 0;
        try {
            for (long i = 0; i < target; i++) {
                Event event = queue.take();
                if (!event.isExit()) {
                    count++;
                }
            }
            doneQueue.put(count);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private void dispatchTo(Event event, long count, ArrayBlockingQueue<Event> addr) {
        try {
            for (long i = 0; i < count; i++) {
                addr.put(event.clone());
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_SingleWorker_IntEvent(Blackhole bh) {
        runBenchmark(1, 10000, 0, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_SingleWorker_StrEvent(Blackhole bh) {
        runBenchmark(1, 10000, 1, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_Worker_N8(Blackhole bh) {
        runBenchmark(8, 100000, 0, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_Worker_N16(Blackhole bh) {
        runBenchmark(16, 100000, 1, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_Worker_N32(Blackhole bh) {
        runBenchmark(32, 100000, 0, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_Worker_N64(Blackhole bh) {
        runBenchmark(64, 100000, 1, 64, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_EventSize_S8(Blackhole bh) {
        runBenchmark(8, 100000, 1, 8, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_EventSize_S1024(Blackhole bh) {
        runBenchmark(8, 100000, 1, 1024, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_EventSize_S65536(Blackhole bh) {
        runBenchmark(8, 100000, 1, 65536, 64, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_QueueSize_N16(Blackhole bh) {
        runBenchmark(8, 100000, 0, 64, 16, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_QueueSize_N256(Blackhole bh) {
        runBenchmark(8, 100000, 1, 64, 256, bh);
    }

    @Benchmark
    public void BenchmarkArrayBlockingQueue_class_QueueSize_N1024(Blackhole bh) {
        runBenchmark(8, 100000, 0, 64, 1024, bh);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayBlockingQueue_class.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
