/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkLog {
    private static final Logger logger = LogManager.getLogger(BenchmarkLog.class);

    @Benchmark
    public void BenchmarkLog_Trace(){
        logger.trace("打印 TRACE 级别日志！");
    }

    @Benchmark
    public void BenchmarkLog_DEBUG(){
        logger.debug("打印 DEBUG 级别日志！");
    }

    @Benchmark
    public void BenchmarkLog_INFO(){
        logger.info("打印 INFO 级别日志！");
    }

    @Benchmark
    public void BenchmarkLog_WARN(){
        logger.warn("打印 WARN 级别日志！");
    }

    @Benchmark
    public void BenchmarkLog_ERROR(){
        logger.error("打印 ERROR 级别日志！");
    }


    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLog.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
