/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package client_http_test

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"
	"testing"
)

func benchmarkHttpClientGet(b *testing.B, bodysize int) {
	url := fmt.Sprintf("http://localhost:60001/get%s", strconv.Itoa(bodysize))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		resp, err := http.Get(url)
		if err != nil {
			fmt.Println(err)
		}
		defer resp.Body.Close()
		_, err1 := ioutil.ReadAll(resp.Body)
		if err1 != nil {
			panic(err1)
		}
	}
}

func BenchmarkHttpClientGet_N_0(b *testing.B) { benchmarkHttpClientGet(b, 0) }
func BenchmarkHttpClientGet_N_32(b *testing.B) { benchmarkHttpClientGet(b, 32) }
func BenchmarkHttpClientGet_N_256(b *testing.B) { benchmarkHttpClientGet(b, 256) }
func BenchmarkHttpClientGet_N_2048(b *testing.B) { benchmarkHttpClientGet(b, 2048) }
func BenchmarkHttpClientGet_N_16384(b *testing.B) { benchmarkHttpClientGet(b, 16384) }
func BenchmarkHttpClientGet_N_131072(b *testing.B) { benchmarkHttpClientGet(b, 131072) }
func BenchmarkHttpClientGet_N_1048576(b *testing.B) { benchmarkHttpClientGet(b, 1048576) }

func benchmarkHttpClientPost(b *testing.B, bodysize int) {
	url := "http://127.0.0.1:60001/post"
	body := make([]byte, bodysize)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		resp, err := http.Post(url, "application/octet-stream", bytes.NewReader(body))
		if err != nil {
			fmt.Println(err)
		}
		defer resp.Body.Close()
	}
}

func BenchmarkHttpClientPost_N_0(b *testing.B) { benchmarkHttpClientPost(b, 0) }
func BenchmarkHttpClientPost_N_32(b *testing.B) { benchmarkHttpClientPost(b, 32) }
func BenchmarkHttpClientPost_N_256(b *testing.B) { benchmarkHttpClientPost(b, 256) }
func BenchmarkHttpClientPost_N_2048(b *testing.B) { benchmarkHttpClientPost(b, 2048) }
func BenchmarkHttpClientPost_N_16384(b *testing.B) { benchmarkHttpClientPost(b, 16384) }
func BenchmarkHttpClientPost_N_131072(b *testing.B) { benchmarkHttpClientPost(b, 131072) }
func BenchmarkHttpClientPost_N_1048576(b *testing.B) { benchmarkHttpClientPost(b, 1048576) }