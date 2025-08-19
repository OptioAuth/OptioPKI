##################################################################
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.  
#
##################################################################
#
# Company: OptioAuth
# Name: test_nmap_server_ciphers.sh 
# Purpose: Show HTTPS server ciphers 
# Author: Jay Mayers optioauth@gmail
#
##################################################################
#
if [ $# -ne 2 ]; then
	echo "$0 <HTTPS Hostname/IP> <HTTPS PORT>"
	exit 1;
fi
HTTPS=$1
PORT=$2
#
##################################################################
nmap -sV --script ssl-enum-ciphers -p ${PORT} ${HTTPS}

