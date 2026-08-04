/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package client_https_test

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"crypto/tls"
	"net/http"
	"strconv"
	"testing"
)

func benchmarkHttpsClientGet(b *testing.B, bodysize int) {
	url := fmt.Sprintf("https://127.0.0.1:60002/get%s", strconv.Itoa(bodysize))
	tr := &http.Transport{
		TLSClientConfig:   &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{
		Transport: tr,
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req, err := http.NewRequest("GET", url, nil)
		if err != nil {
			fmt.Println(err)

			return
		}
		req.Proto = "HTTP/1.1"
	
		resp, err := client.Do(req)
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err1 := ioutil.ReadAll(resp.Body)
		if err1 != nil {
			panic(err1)
		}
	}
}

func BenchmarkHttpsClientGet_N_0(b *testing.B) { benchmarkHttpsClientGet(b, 0) }
func BenchmarkHttpsClientGet_N_32(b *testing.B) { benchmarkHttpsClientGet(b, 32) }
func BenchmarkHttpsClientGet_N_256(b *testing.B) { benchmarkHttpsClientGet(b, 256) }
func BenchmarkHttpsClientGet_N_2048(b *testing.B) { benchmarkHttpsClientGet(b, 2048) }
func BenchmarkHttpsClientGet_N_16384(b *testing.B) { benchmarkHttpsClientGet(b, 16384) }
func BenchmarkHttpsClientGet_N_131072(b *testing.B) { benchmarkHttpsClientGet(b, 131072) }
func BenchmarkHttpsClientGet_N_1048576(b *testing.B) { benchmarkHttpsClientGet(b, 1048576) }

func benchmarkHttpsClientPost(b *testing.B, bodysize int) {
	url := "https://127.0.0.1:60002/post"
	body := make([]byte, bodysize)
	tr := &http.Transport{
		TLSClientConfig:   &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{
		Transport: tr,
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req, err := http.NewRequest("POST", url, bytes.NewReader(body))
		if err != nil {
			fmt.Println(err)

			return
		}
		req.Proto = "HTTP/1.1"
	
		resp, err := client.Do(req)
		if err != nil {
			fmt.Println(err)
			return
		}
		if resp.StatusCode != http.StatusOK {
			fmt.Println(err)
		}
	}
}

func BenchmarkHttpsClientPost_N_0(b *testing.B) { benchmarkHttpsClientPost(b, 0) }
func BenchmarkHttpsClientPost_N_32(b *testing.B) { benchmarkHttpsClientPost(b, 32) }
func BenchmarkHttpsClientPost_N_256(b *testing.B) { benchmarkHttpsClientPost(b, 256) }
func BenchmarkHttpsClientPost_N_2048(b *testing.B) { benchmarkHttpsClientPost(b, 2048) }
func BenchmarkHttpsClientPost_N_16384(b *testing.B) { benchmarkHttpsClientPost(b, 16384) }
func BenchmarkHttpsClientPost_N_131072(b *testing.B) { benchmarkHttpsClientPost(b, 131072) }
func BenchmarkHttpsClientPost_N_1048576(b *testing.B) { benchmarkHttpsClientPost(b, 1048576) }