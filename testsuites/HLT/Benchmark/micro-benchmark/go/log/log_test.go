/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package log

import (
	"os"
	"log/slog"
	"testing"
)

func BenchmarkLog_Trace(b *testing.B) {
	opts := &slog.HandlerOptions{
        Level: slog.LevelDebug,
    }

    handler := slog.NewTextHandler(os.Stdout, opts)

    logger := slog.New(handler)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		logger.Debug("打印 TRACE 级别日志！")
	}
}

func BenchmarkLog_DEBUG(b *testing.B) {
	opts := &slog.HandlerOptions{
        Level: slog.LevelDebug,
    }

    handler := slog.NewTextHandler(os.Stdout, opts)

    logger := slog.New(handler)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		logger.Debug("打印 Debug 级别日志！")
	}
}

func BenchmarkLog_INFO(b *testing.B) {
	for i := 0; i < b.N; i++ {
		slog.Info("打印 INFO 级别日志！")
	}
}

func BenchmarkLog_WARN(b *testing.B) {
	for i := 0; i < b.N; i++ {
		slog.Warn("打印 WARN 级别日志！")
	}
}

func BenchmarkLog_ERROR(b *testing.B) {
	for i := 0; i < b.N; i++ {
		slog.Error("打印 ERROR 级别日志！")
	}
}