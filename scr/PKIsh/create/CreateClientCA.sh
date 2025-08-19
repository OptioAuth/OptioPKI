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
# Name: CreateClientCA.sh
# Purpose: Create the client key (client.key.pem) signing uses extensions usr_cert 
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
# Encrypt the intermediate key with AES 256-bit encryption and a strong password.
#
# Use the private key to create a certificate signing request (CSR). 
# The CSR details don’t need to match the intermediate CA. 
#
# For client certificates, the Common Name must be a fully qualified domain name (eg, example.com), 
# whereas for client certificates it can be any unique identifier (eg, an e-mail address). 
#
# Note that the Common Name cannot be the same as either your root or intermediate certificate.
#
#
# For client certificates, 
# it might be useful (and required for latest browsers) to provide subjectAltName (SAN) extension, 
# so that the certificate will be valid (besides the Common Name) for other host names too. 
#
# Use -addext switch to provide them (openssl 1.1.1 is needed) as shown in the example below. 
# For older versions of openssl, SAN can be specified by creating a new section (for example alt_names) 
# in client/client_openssl.cnf file and reference it in client_cert section.
#
# The index.txt file is where OpenSSL ca tool stores the certificate database. 
# Do not delete or edit this file by hand. 
# It should now contain a line that refers to the intermediate certificate.
#
##################################################################
# 

cd ${BASE_DIR}

openssl ca -config root/intermediate/intermediate_openssl.cnf -extensions usr_cert -days 90 -notext -md sha256 -in client/csr/client.csr.pem -out client/certs/client.cert.pem

chmod 444 client/certs/client.cert.pem


