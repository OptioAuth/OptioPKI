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
# Name: PrepareClientDir.sh
# Purpose: Create the Client ENV 
# Author: Jay Mayers optioauth@gmail
#
#
#################################################################
BASE_DIR=$1
if [ $# -ne 1 ]; then
	echo "$0 <Base PKI Dir> <Build PKI Dir>"
	exit 1;
fi
if [ ! -d $BASE_DIR ]; then
	echo "BASE_DIR $BASE_DIR Not Found"
	exit 1;
fi
#
#################################################################
#
# Use the private key to create a certificate signing request (CSR). 
# The CSR details don’t need to match the intermediate CA. 
#
# For client certificates, the Common Name must be a fully qualified domain name (eg, example.com), 
# whereas for client certificates it can be any unique identifier (eg, an e-mail address). 
#
# Note that the Common Name cannot be the same as either your root or intermediate certificate.

#
# For client certificates, 
# it might be useful (and required for latest browsers) to provide subjectAltName (SAN) extension, 
# so that the certificate will be valid (besides the Common Name) for other host names too. 
#
# Use -addext switch to provide them (openssl 1.1.1 is needed) as shown in the example below. 
# For older versions of openssl, SAN can be specified by creating a new section (for example alt_names) 
# in intermediate/openssl.cnf file and reference it in client_cert section.
#
#################################################################
# 
cd ${BASE_DIR}
mkdir ${BASE_DIR}/client

cp ${BASE_DIR}/cnf/client_openssl.cnf ${BASE_DIR}/client

# 
#################################################################
# In this example, the client folder resides inside /root/ca. That is just for convenience, 
# furthermore, this is to be considered a bad practice to be in the same location and system 
# The root CA and client CA should be on different machines.
# 
# Create the same directory structure used for the root CA files. 
# It’s convenient to also create a csr directory to hold certificate signing requests.
#################################################################
# 
cd ${BASE_DIR}/client
mkdir certs crl csr newcerts public private
chmod 700 private
touch index.txt
echo 1000 > serial
# 
# Add a crlnumber file to the intermediate CA directory tree. crlnumber is used to keep track of certificate revocation lists.
# 
echo 1000 > ${BASE_DIR}/client/crlnumber

