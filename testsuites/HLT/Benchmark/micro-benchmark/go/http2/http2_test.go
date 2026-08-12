/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package http_test_test

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"crypto/tls"
	"strconv"
	"strings"
	"testing"
	"time"
)

type handler struct{}

func (h *handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	v := r.URL.Query()
	receiveSizeStr := v.Get("receiveSize")
	receiveSize, err := strconv.Atoi(receiveSizeStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	isFormStr := v.Get("isForm")
	isForm, err := strconv.ParseBool(isFormStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if isForm {
		r.ParseForm()
	}

	w.WriteHeader(http.StatusOK)
	data := make([]byte, receiveSize)
	if _, e := w.Write(data); e != nil {
		panic(e)
	}
}

var port int = 62222

func init() {
	server := http.Server{
		Addr:    "0.0.0.0:62222",
		Handler: &handler{},
	}

	go func() {
		err := server.ListenAndServeTLS("data/end_rsa.cer", "data/end_rsa_private_key.pem")
		if err != nil {
			panic(err)
			return
		}
	}()
}

func request(b *testing.B, method string, sendSize int, receiveSize int, isForm bool) {
	if method == http.MethodGet && sendSize != 0 {
		b.Error(fmt.Errorf("invalid %s request: sendSize %d", method, sendSize))
		return
	}
	if method == http.MethodHead && ( sendSize != 0 || receiveSize != 0) {
		b.Error(fmt.Errorf("invalid %s request: sendSize %d, receiveSize %d", method, sendSize, receiveSize))
		return
	}
	data := make([]byte, sendSize)
	for i := 0; i < sendSize; i++ {
		data[i] = 'a'
	}
	var bodyStr string
	if isForm {
		var r http.Request
		err := r.ParseForm()
		if err != nil {
			b.Error(err)
			return
		}
		r.Form.Add("key", string(data))
		bodyStr = strings.TrimSpace(r.Form.Encode())
	}
	url := fmt.Sprintf("Https://localhost:%d?receiveSize=%d&isForm=%v", port, receiveSize, isForm)

	tr := &http.Transport{
		TLSClientConfig:   &tls.Config{InsecureSkipVerify: true},
		ForceAttemptHTTP2: true,
	}
	client := &http.Client{
		Transport: tr,
		Timeout: time.Minute,
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if doRequest(b, client, method, isForm, bodyStr, data, url, receiveSize) {
			return
		}
	}
}

func doRequest(b *testing.B, client *http.Client, method string, isForm bool, bodyStr string, data []byte, url string, receiveSize int) bool {
	var body io.Reader = nil
	if isForm {
		body = strings.NewReader(bodyStr)
	} else {
		body = bytes.NewReader(data)
	}
	request, err := http.NewRequest(method, url, body)
	if err != nil {
		b.Error(err)
		return true
	}
	request.Proto = "HTTP/2.0"
	ctx, cancelFunc := context.WithCancel(context.Background())
	request = request.WithContext(ctx)
	if isForm {
		request.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	}
	resp, err := client.Do(request)
	if err != nil {
		b.Error(err)
		return true
	}
	defer cancelFunc()
	if resp.StatusCode != http.StatusOK {
		b.Error(errors.New("invalid status: " + resp.Status))
		return true
	}
	respData, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		b.Error(err)
		return true
	}
	if len(respData) != receiveSize {
		b.Error(fmt.Errorf("invalid receiveSize: expected %d, actual %d", receiveSize, int64(len(respData))))
		return true
	}
	return false
}

func BenchmarkHttp2Get0_32(b *testing.B) { request(b, http.MethodGet, 0, 32, false) }
func BenchmarkHttp2Get0_256(b *testing.B) { request(b, http.MethodGet, 0, 256, false) }
func BenchmarkHttp2Get0_2K(b *testing.B) { request(b, http.MethodGet, 0, 2*1024, false) }
func BenchmarkHttp2Get0_16K(b *testing.B) { request(b, http.MethodGet, 0, 16*1024, false) }
func BenchmarkHttp2Get0_128K(b *testing.B) { request(b, http.MethodGet, 0, 128*1024, false) }
func BenchmarkHttp2Get0_1M(b *testing.B) { request(b, http.MethodGet, 0, 1024*1024, false) }
func BenchmarkHttp2Get0_8M(b *testing.B) { request(b, http.MethodGet, 0, 8*1024*1024, false) }
func BenchmarkHttp2Get0_64M(b *testing.B) { request(b, http.MethodGet, 0, 64*1024*1024, false) }
func BenchmarkHttp2Get0_512M(b *testing.B) { request(b, http.MethodGet, 0, 512*1024*1024, false) }
func BenchmarkHttp2Get0_4G(b *testing.B) { request(b, http.MethodGet, 0, 4*1024*1024*1024, false) }

func BenchmarkHttp2Head(b *testing.B) { request(b, http.MethodHead, 0, 0, false) }

func BenchmarkHttp2Delete(b *testing.B) { request(b, http.MethodDelete, 0, 0, true) }

func BenchmarkHttp2Post0_32(b *testing.B) { request(b, http.MethodPost, 0, 32, false) }
func BenchmarkHttp2Post0_256(b *testing.B) { request(b, http.MethodPost, 0, 256, false) }
func BenchmarkHttp2Post0_2K(b *testing.B) { request(b, http.MethodPost, 0, 2*1024, false) }
func BenchmarkHttp2Post0_16K(b *testing.B) { request(b, http.MethodPost, 0, 16*1024, false) }
func BenchmarkHttp2Post0_128K(b *testing.B) { request(b, http.MethodPost, 0, 128*1024, false) }
func BenchmarkHttp2Post0_1M(b *testing.B) { request(b, http.MethodPost, 0, 1024*1024, false) }
func BenchmarkHttp2Post0_8M(b *testing.B) { request(b, http.MethodPost, 0, 8*1024*1024, false) }
func BenchmarkHttp2Post0_64M(b *testing.B) { request(b, http.MethodPost, 0, 64*1024*1024, false) }
func BenchmarkHttp2Post0_512M(b *testing.B) { request(b, http.MethodPost, 0, 512*1024*1024, false) }
func BenchmarkHttp2Post0_4G(b *testing.B) { request(b, http.MethodPost, 0, 4*1024*1024*1024, false) }

func BenchmarkHttp2Post32_0(b *testing.B) { request(b, http.MethodPost, 32, 0, false) }
func BenchmarkHttp2Post256_0(b *testing.B) { request(b, http.MethodPost, 256, 0, false) }
func BenchmarkHttp2Post2K_0(b *testing.B) { request(b, http.MethodPost, 2*1024, 0, false) }
func BenchmarkHttp2Post16K_0(b *testing.B) { request(b, http.MethodPost, 16*1024, 0, false) }
func BenchmarkHttp2Post128K_0(b *testing.B) { request(b, http.MethodPost, 128*1024, 0, false) }
func BenchmarkHttp2Post1M_0(b *testing.B) { request(b, http.MethodPost,1024*1024, 0,  false) }
func BenchmarkHttp2Post8M_0(b *testing.B) { request(b, http.MethodPost,8*1024*1024, 0,  false) }
func BenchmarkHttp2Post64M_0(b *testing.B) { request(b, http.MethodPost, 64*1024*1024, 0, false) }
func BenchmarkHttp2Post512M_0(b *testing.B) { request(b, http.MethodPost, 512*1024*1024, 0, false) }
func BenchmarkHttp2Post4G_0(b *testing.B) { request(b, http.MethodPost, 4*1024*1024*1024, 0, false) }

func BenchmarkHttp2Put0_32(b *testing.B) { request(b, http.MethodPut, 0, 32, false) }
func BenchmarkHttp2Put0_256(b *testing.B) { request(b, http.MethodPut, 0, 256, false) }
func BenchmarkHttp2Put0_2K(b *testing.B) { request(b, http.MethodPut, 0, 2*1024, false) }
func BenchmarkHttp2Put0_16K(b *testing.B) { request(b, http.MethodPut, 0, 16*1024, false) }
func BenchmarkHttp2Put0_128K(b *testing.B) { request(b, http.MethodPut, 0, 128*1024, false) }
func BenchmarkHttp2Put0_1M(b *testing.B) { request(b, http.MethodPut, 0, 1024*1024, false) }
func BenchmarkHttp2Put0_8M(b *testing.B) { request(b, http.MethodPut, 0, 8*1024*1024, false) }
func BenchmarkHttp2Put0_64M(b *testing.B) { request(b, http.MethodPut, 0, 64*1024*1024, false) }
func BenchmarkHttp2Put0_512M(b *testing.B) { request(b, http.MethodPut, 0, 512*1024*1024, false) }
func BenchmarkHttp2Put0_4G(b *testing.B) { request(b, http.MethodPut, 0, 4*1024*1024*1024, false) }

func BenchmarkHttp2Put32_0(b *testing.B) { request(b, http.MethodPut, 32, 0, false) }
func BenchmarkHttp2Put256_0(b *testing.B) { request(b, http.MethodPut, 256, 0, false) }
func BenchmarkHttp2Put2K_0(b *testing.B) { request(b, http.MethodPut, 2*1024, 0, false) }
func BenchmarkHttp2Put16K_0(b *testing.B) { request(b, http.MethodPut, 16*1024, 0, false) }
func BenchmarkHttp2Put128K_0(b *testing.B) { request(b, http.MethodPut, 128*1024, 0, false) }
func BenchmarkHttp2Put1M_0(b *testing.B) { request(b, http.MethodPut,1024*1024, 0,  false) }
func BenchmarkHttp2Put8M_0(b *testing.B) { request(b, http.MethodPut,8*1024*1024, 0,  false) }
func BenchmarkHttp2Put64M_0(b *testing.B) { request(b, http.MethodPut, 64*1024*1024, 0, false) }
func BenchmarkHttp2Put512M_0(b *testing.B) { request(b, http.MethodPut, 512*1024*1024, 0, false) }
func BenchmarkHttp2Put4G_0(b *testing.B) { request(b, http.MethodPut, 4*1024*1024*1024, 0, false) }

func BenchmarkHttp2PostForm32_0(b *testing.B) { request(b, http.MethodPost, 32, 0, true) }
func BenchmarkHttp2PostForm256_0(b *testing.B) { request(b, http.MethodPost, 256, 0, true) }
func BenchmarkHttp2PostForm2K_0(b *testing.B) { request(b, http.MethodPost, 2*1024, 0, true) }
func BenchmarkHttp2PostForm16K_0(b *testing.B) { request(b, http.MethodPost, 16*1024, 0, true) }
func BenchmarkHttp2PostForm128K_0(b *testing.B) { request(b, http.MethodPost, 128*1024, 0, true) }
func BenchmarkHttp2PostForm1M_0(b *testing.B) { request(b, http.MethodPost,1024*1024, 0,  true) }
func BenchmarkHttp2PostForm8M_0(b *testing.B) { request(b, http.MethodPost,8*1024*1024, 0,  true) }
func BenchmarkHttp2PostForm64M_0(b *testing.B) { request(b, http.MethodPost, 64*1024*1024, 0, true) }
func BenchmarkHttp2PostForm512M_0(b *testing.B) { request(b, http.MethodPost, 512*1024*1024, 0, true) }
func BenchmarkHttp2PostForm4G_0(b *testing.B) { request(b, http.MethodPost, 4*1024*1024*1024, 0, true) }

func BenchmarkHttp2PutForm32_0(b *testing.B) { request(b, http.MethodPut, 32, 0, true) }
func BenchmarkHttp2PutForm256_0(b *testing.B) { request(b, http.MethodPut, 256, 0, true) }
func BenchmarkHttp2PutForm2K_0(b *testing.B) { request(b, http.MethodPut, 2*1024, 0, true) }
func BenchmarkHttp2PutForm16K_0(b *testing.B) { request(b, http.MethodPut, 16*1024, 0, true) }
func BenchmarkHttp2PutForm128K_0(b *testing.B) { request(b, http.MethodPut, 128*1024, 0, true) }
func BenchmarkHttp2PutForm1M_0(b *testing.B) { request(b, http.MethodPut,1024*1024, 0,  true) }
func BenchmarkHttp2PutForm8M_0(b *testing.B) { request(b, http.MethodPut,8*1024*1024, 0,  true) }
func BenchmarkHttp2PutForm64M_0(b *testing.B) { request(b, http.MethodPut, 64*1024*1024, 0, true) }
func BenchmarkHttp2PutForm512M_0(b *testing.B) { request(b, http.MethodPut, 512*1024*1024, 0, true) }
func BenchmarkHttp2PutForm4G_0(b *testing.B) { request(b, http.MethodPut, 4*1024*1024*1024, 0, true) }
