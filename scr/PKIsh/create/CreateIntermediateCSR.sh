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
# Name: CreateIntermediateCA.sh
# Purpose: Create the intermediate key (intermediate.key.pem). 
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
# Encrypt the intermediate key with AES 256-bit encryption and a strong password.
#
#
# To create an intermediate certificate, use the root CA with the v3_intermediate_ca extension to sign 
# the intermediate CSR. 
#
# The intermediate certificate should be valid for a shorter period than the root certificate. 
# 3-5 years would be reasonable. 
#
# The index.txt file is where the OpenSSL ca tool stores the certificate database. 
# Do not delete or edit this file by hand. 
# It should now contain a line that refers to the intermediate certificate.
#
##################################################################
#
cd $BASE_DIR

openssl genrsa -aes256 -out root/intermediate/private/intermediate.key.pem 4096

chmod 400 root/intermediate/private/intermediate.key.pem

openssl req -config root/intermediate/intermediate_openssl.cnf -new -sha256 -key root/intermediate/private/intermediate.key.pem  -out root/intermediate/csr/intermediate.csr.pem


