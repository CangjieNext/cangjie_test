# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import json
import logging
import plotly.express as px
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
  if 'comp_worker_pid' not in tests[0]:
    logging.error('Please run harness with the --profile option to collect the necessary data.')
    exit(1)
  tests.sort(key=lambda item: item['comp_worker_pid'])
  logging.info('Total number of tests: %s', len(tests))
  tests_compile = [dict(PipeID=str(item['comp_worker_pid']), Start=datetime.fromtimestamp(item['compile_start']), Finish=datetime.fromtimestamp(
      item['compile_stop']), Test=item['name'], Type='Compile') for item in tests if item['compile_start'] is not None]
  tests_execute = [dict(PipeID=str(item['exec_worker_pid']), Start=datetime.fromtimestamp(item['execute_start']), Finish=datetime.fromtimestamp(
      item['execute_stop']), Test=item['name'], Type='Execute') for item in tests if item['execute_start'] is not None]
  tests_compile.extend(tests_execute)
  df = pd.DataFrame(tests_compile)

  fig = px.timeline(df, x_start='Start', x_end='Finish', y='PipeID', color='Type', hover_data=['Test'], title='Compiling/executing tests in pipes')
  fig.update_yaxes(autorange='reversed')
  fig.update_layout(yaxis=dict(tickfont=dict(size=8)))
  fig.update_xaxes(rangeslider_visible=True)

  fig.write_html(report_file, auto_open=False)


def main():
  '''Initialization of plotter and generate report'''
  parser = create_parser()
  data_file, report_file = process_args(parser)
  create_gantt_chart(data_file, report_file)


if __name__ == '__main__':
  main()
