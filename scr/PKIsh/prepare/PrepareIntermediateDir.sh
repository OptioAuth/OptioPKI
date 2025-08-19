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
# Name: PrepareIntermediateDir.sh
# Purpose: Create the Intermediate ENV 
# Author: Jay Mayers optioauth@gmail
#
#
##################################################################
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
# An intermediate certificate authority (CA) is an entity that can sign certificates on behalf 
# of the root CA. The root CA signs the intermediate certificate, forming a chain of trust.
# 
# The purpose of using an intermediate CA is primarily for security. 
# The root key can be kept offline and used as infrequently as possible. 
# If the intermediate key is compromised, the root CA can revoke the intermediate certificate 
# and create a new intermediate cryptographic pair.
# 
# Prepare the intermediate directory
# The root CA files are kept in /root/ca. 
# Choose a different directory (/root/intermediate) to store the intermediate CA files.
##################################################################
# 
cd ${BASE_DIR}
mkdir ${BASE_DIR}/root/intermediate

cp ${BASE_DIR}/cnf/intermediate_openssl.cnf ${BASE_DIR}/root/intermediate
# 
##################################################################
# In this example, the intermediate folder resides inside /root/ca. That is just for convenience, 
# furthermore, this is to be considered a bad practice to be in the same location and system 
# The root CA and intermediate CA should be on different machines.
# 
# Create the same directory structure used for the root CA files. 
# It’s convenient to also create a csr directory to hold certificate signing requests.
##################################################################
# 
cd ${BASE_DIR}/root/intermediate
mkdir certs crl csr newcerts private public
chmod 700 private
touch index.txt
echo 1000 > serial
# 
# Add a crlnumber file to the intermediate CA directory tree. crlnumber is used to keep track of certificate revocation lists.
# 
echo 1000 > ${BASE_DIR}/root/intermediate/crlnumber

