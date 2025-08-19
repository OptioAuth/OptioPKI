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
# Name: CreateRootCA.sh
# Purpose: Creat root ca ( ca.key.pem) Never share 
# Author: Jay Mayers optioauth@gmail
#
##################################################################
#
C=US
ST=California
L="Temecula"
O="OptioAuth, LLC"
OU="Security Operations"
CN="OptioAuth, LLC Root CA"
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
# To create a Root certificate, the root CA with the v3_intermediate_ca extension to self-sign
# using it's own CSR. This is the root CA. It self-signs, the buck stops here. OptioCon will
# have  TPM access and creating Root CA will use this  
#
##################################################################
#
#


cd $BASE_DIR

openssl genrsa -aes256 -out root/ca/private/ca.key.pem 4096

chmod 400 root/ca/private/ca.key.pem

openssl req -config root/ca/root_openssl.cnf -key root/ca/private/ca.key.pem -new -x509 -days 7300 -sha256 -extensions v3_ca -out root/ca/certs/ca.cert.pem 



