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
cd $BASE_DIR
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
#  Note: This time, specify the root CA configuration file (openssl.cnf).

openssl ca -config root/ca/root_openssl.cnf -extensions v3_intermediate_ca -days 3650 -notext -md sha256 -in root/intermediate/csr/intermediate.csr.pem -out root/intermediate/certs/intermediate.cert.pem

chmod 444 root/intermediate/certs/intermediate.cert.pem



