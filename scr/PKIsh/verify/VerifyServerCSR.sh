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
# Name: VerifyServerCA.sh  
# Purpose:  Verify the server CSR
# Author: Jay Mayers optioauth@gmail
#
##################################################################
#
BASE_DIR=$1
if [ $# -ne 1 ]; then
	echo "$0 <Base PKI Dir>"
	exit 1;
fi
if [ ! -d $BASE_DIR ]; then
	echo "BASE_DIR $BASE_DIR Not Found"
	exit 1;
fi
#
##################################################################
#
# Verify the server certificate
# As we did for the root certificate, check that the details of the server certificate are correct.
#
##################################################################
#

cd ${BASE_DIR}

#
# Verify CSR
#
openssl req -text -noout -verify -in server/csr/server.csr.pem

#
# Verify Private Key
#

openssl rsa -in server/private/server.key.pem -check


