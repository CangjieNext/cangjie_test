/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array

import (
	"testing"
	"strings"
)

// go 仅提供基线

var str string
func benchmarkD1ToStringRun(b *testing.B, arrLen int) {
	arr := make([]string, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = "a"
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		str = strings.Join(arr, ",")
	}
}

func BenchmarkArrayToStringD1_N32(b *testing.B)      { benchmarkD1ToStringRun(b, 32) }
func BenchmarkArrayToStringD1_N256(b *testing.B)     { benchmarkD1ToStringRun(b, 256) }
func BenchmarkArrayToStringD1_N2048(b *testing.B)    { benchmarkD1ToStringRun(b, 2048) }
func BenchmarkArrayToStringD1_N1048576(b *testing.B) { benchmarkD1ToStringRun(b, 1048576) }

func BenchmarkArrayToStringD2_N32(b *testing.B)      { benchmarkD1ToStringRun(b, 32) }
func BenchmarkArrayToStringD2_N256(b *testing.B)      { benchmarkD1ToStringRun(b, 256) }
func BenchmarkArrayToStringD2_N2048(b *testing.B)      { benchmarkD1ToStringRun(b, 2048) }
func BenchmarkArrayToStringD3_N32(b *testing.B)      { benchmarkD1ToStringRun(b, 32) }
func BenchmarkArrayToStringD3_N128(b *testing.B)      { benchmarkD1ToStringRun(b, 128) }