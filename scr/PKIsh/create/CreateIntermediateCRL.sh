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
# Name: CreateIntermediateCRL.sh
# Purpose: Create the intermediate Certificate Revocation List (intermediate.rcl.pem). 
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
# When a certificate authority signs a certificate, 
# it will normally encode the CRL location into the certificate. 
# Add crlDistributionPoints to the appropriate sections. 
# In our case, add it to the [ server_cert ] section.
#
# If No certificates have been revoked yet, so the output will state No Revoked Certificates.
#
# You should re-create the CRL at regular intervals. 
# By default, the CRL expires after 30 days. 
# This is controlled by the default_crl_days option in the [ CA_default ] section.
#
##################################################################
#

cd ${BASE_DIR}

openssl ca -config root/intermediate/intermediate_openssl.cnf -gencrl -out root/intermediate/crl/intermediate.crl.pem

openssl crl -in root/intermediate/crl/intermediate.crl.pem -noout -text

