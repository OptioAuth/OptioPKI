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
# Name: PrepareRootDir.sh
# Purpose: Create the Root CA ENV 
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
# Choose a directory (/root/ca) to store all keys and certificates
#
##################################################################
#
cd $BASE_DIR
#
mkdir -p root/ca
chmod 700 root/ca

# Create the directory structure. The index.txt and serial files act as a flat file database to keep track of signed certificates.

cp ${BASE_DIR}/cnf/root_openssl.cnf ${BASE_DIR}/root/ca

cd root/ca
mkdir certs crl newcerts private public
chmod 700 private
touch index.txt
echo 1000 > serial


