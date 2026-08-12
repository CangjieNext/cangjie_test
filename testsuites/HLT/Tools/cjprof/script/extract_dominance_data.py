# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""
Script to extract dominance API data from .data files using cjprof HTTP server.
Usage: python extract_dominance_data.py <data_file>
"""

import subprocess
import time
import urllib.request
import json
import sys
import os
import signal
import re

def find_cjprof():
    """Find cjprof executable"""
    for name in ['cjprof', 'cjprof.exe']:
        for path in os.environ['PATH'].split(os.pathsep):
            full_path = os.path.join(path, name)
            if os.path.isfile(full_path):
                return full_path
    return 'cjprof'

def start_server(data_file, port=19000):
    """Start cjprof HTTP server"""
    cjprof = find_cjprof()
    cmd = [cjprof, 'heap', '-i', data_file, f'--dump-report={port}']
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return proc

def read_actual_port(proc, timeout=15):
    """Read actual port from cjprof stdout"""
    import threading
    actual = {'port': None}
    
    def reader():
        if proc.stdout is None:
            return
        deadline = time.time() + timeout
        for line in proc.stdout:
            m = re.search(r'localhost:(\d+)', line)
            if m and actual['port'] is None:
                actual['port'] = int(m.group(1))
                return
            if time.time() > deadline:
                return
    
    t = threading.Thread(target=reader, daemon=True)
    t.start()
    t.join(timeout)
    return actual['port']

def fetch_api(port, endpoint):
    """Fetch API endpoint"""
    url = f'http://127.0.0.1:{port}{endpoint}'
    try:
        raw = urllib.request.urlopen(url, timeout=10).read()
        return json.loads(raw.decode('utf-8'))
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        return None

def kill_server(proc):
    """Kill cjprof server"""
    try:
        if sys.platform == 'win32':
            subprocess.call(['taskkill', '/F', '/PID', str(proc.pid)],
                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        else:
            os.killpg(os.getpgid(proc.pid), signal.SIGTERM)
    except Exception:
        pass

def extract_dominance_info(data_file):
    """Extract dominance data and generate info content"""
    print(f"Starting cjprof with {data_file}...")
    
    proc = start_server(data_file)
    port = read_actual_port(proc)
    
    if port is None:
        print("Failed to start server")
        kill_server(proc)
        return None
    
    print(f"Server started on port {port}")
    
    # Wait for server to be ready
    time.sleep(2)
    
    result = {
        'tree': None,
        'top10': None,
        'by_type': None
    }
    
    # Fetch dominance tree
    result['tree'] = fetch_api(port, '/api/dominance/tree')
    result['top10'] = fetch_api(port, '/api/dominance/top10')
    result['by_type'] = fetch_api(port, '/api/dominance/tree-by-type')
    
    kill_server(proc)
    return result

def main():
    if len(sys.argv) < 2:
        print("Usage: python extract_dominance_data.py <data_file>")
        sys.exit(1)
    
    data_file = sys.argv[1]
    if not os.path.isfile(data_file):
        print(f"File not found: {data_file}")
        sys.exit(1)
    
    result = extract_dominance_info(data_file)
    
    if result:
        print("\n=== /api/dominance/tree ===")
        print(json.dumps(result['tree'], indent=2)[:2000])
        
        print("\n=== /api/dominance/top10 ===")
        print(json.dumps(result['top10'], indent=2)[:2000])
        
        print("\n=== /api/dominance/tree-by-type ===")
        print(json.dumps(result['by_type'], indent=2)[:2000])

if __name__ == "__main__":
    main()