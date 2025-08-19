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
# Name: CreateCAChain.sh
# Purpose: Create the certificate chain file
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
# When an application (eg, a web browser) tries to verify a certificate signed by the intermediate CA, 
# it must also verify the intermediate certificate against the root certificate. 
# To complete the chain of trust, create a CA certificate chain to present to the application.
#
# To create the CA certificate chain, concatenate the intermediate and root certificates together. 
# We will use this file later to verify certificates signed by the intermediate CA.
#
# Our certificate chain file must include the root certificate because no client application knows 
# about it yet. A better option, particularly if you’re administrating an intranet, 
# is to install your root certificate on every client that needs to connect. 
# In that case, the chain file need only contain your intermediate certificate.
#
##################################################################
#


cat root/intermediate/certs/intermediate.cert.pem  root/ca/certs/ca.cert.pem > root/intermediate/certs/ca-chain.cert.pem

chmod 400 root/intermediate/certs/ca-chain.cert.pem

