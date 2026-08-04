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
)

func benchmarkD1CloneRun(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for j, v := range arr {
		arr[j] = v + 1
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		dst := make([]int, arrLen)
		copy(dst, arr)
	}
}

func BenchmarkArrayCloneD1_N32(b *testing.B)      { benchmarkD1CloneRun(b, 32) }
func BenchmarkArrayCloneD1_N256(b *testing.B)     { benchmarkD1CloneRun(b, 256) }
func BenchmarkArrayCloneD1_N2048(b *testing.B)    { benchmarkD1CloneRun(b, 2048) }
func BenchmarkArrayCloneD1_N1048576(b *testing.B) { benchmarkD1CloneRun(b, 1048576) }
