# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import json
import logging
import plotly.express as px
import plotly.graph_objects as go
import pandas as pd
from datetime import datetime
from os.path import exists, isfile


def create_parser():
  '''Gantt plot arguments parser'''
  parser = argparse.ArgumentParser(
      description='Building a Gantt chart for running tests in Cangjie', formatter_class=argparse.RawTextHelpFormatter)
  parser.add_argument('--data-file', '-i', action='store', dest='data_file', required=True,
                      help='Path to file with test run data')
  parser.add_argument('--output-file', '-o', action='store', dest='output_file', required=True,
                      help='Path to the file to save the HTML with Gantt chart.')
  return parser


def process_args(parser: argparse.ArgumentParser):
  '''Process arguments from arguments parser'''
  args = parser.parse_args()
  # input data
  if exists(args.data_file) and isfile(args.data_file):
    data_file = args.data_file
    logging.info('The data file: %s', data_file)
  else:
    logging.error('The path to the data file is incorrect: %s', args.data_file)
    exit(1)

  # output file
  if exists(args.output_file) and isfile(args.output_file):
    logging.warning('The output file %s already exists. It will be overwritten.', args.output_file)

  report_file = args.output_file
  logging.info('The output file: %s', report_file)

  return data_file, report_file


def create_gantt_chart(data_file, report_file):
  '''Create Gantt chart from data file and store it to report file'''
  with open(data_file, 'r', encoding='utf-8') as read_file:
    data = json.load(read_file)
  tests: list = data[2:-1]  # We skips tests run config and drivers metainformation
  t_limit = 1
  long_tests = []
  tests_amount = len(tests)
  exec_tests_amount = 0
  num_tests_long_run = 0
  for item in tests:
    run_time = 0
    if item['execute_time'] is not None:
      run_time = item['execute_time']
      exec_tests_amount += 1
      item['run_time'] = run_time
      long_tests.append(item)
    if run_time > t_limit:
      num_tests_long_run += 1
  long_tests_percentage = round(num_tests_long_run / exec_tests_amount * 100, 2)
  print(f"EXECUTABLE TESTS FOUND: {exec_tests_amount}\nTESTS WITH EXECUTED TIME > 1 SEC: {num_tests_long_run}")
  print(f"{long_tests_percentage}% of runnable test cases take more than 1 second of clock time to run")
  long_tests.sort(key=lambda item: item['test_path'])

  long_tests.sort(key=lambda item: item['run_time'])
  # long_tests = long_tests[-100:]
  tests_compile = [dict(RunTime=item['run_time'], Name=item['name'], Test=item['test_path']) for item in long_tests]
  df = pd.DataFrame(tests_compile)

  fig = px.bar(df, range_x=[0, len(long_tests)], y='RunTime', hover_data=['Test'], title=f'Sorted by time {exec_tests_amount} executable tests from {data_file}')
  fig.add_traces(go.Scatter(x=[i for i in range(len(long_tests))], y=df.RunTime, mode = 'lines', hovertext=df.Test, name='Tests run time'))
  # fig.add_traces(px.scatter(df.sample(1), x="Name", y="RunTime").update_traces(marker_size=20, marker_color="yellow").data)
  # fig.update_yaxes(autorange='reversed')
  # fig.update_layout(yaxis=dict(tickfont=dict(size=8)))
  fig.update_xaxes(rangeslider_visible=True)

  fig.write_html(report_file, auto_open=False)

  if long_tests_percentage > 5:
    exit(1)


def main():
  '''Initialization of plotter and generate report'''
  parser = create_parser()
  data_file, report_file = process_args(parser)
  create_gantt_chart(data_file, report_file)


if __name__ == '__main__':
  main()
