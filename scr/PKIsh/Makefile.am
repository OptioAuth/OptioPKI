bin_SCRIPTS = PrepareRootDir.sh PrepareClientDir.sh  PrepareIntermediateDir.sh  PrepareServerDir.sh CreateCAChain.sh CreateClientCSR.sh CreateIntermediateCRL.sh CreateRootCA.sh CreateServerCSR.sh CreateClientCA.sh CreateIntermediateCA.sh  CreateIntermediateCSR.sh CreateServerCA.sh VerifyClientCA.sh  VerifyIntermediateCA.sh  VerifyRootCA.sh  VerifyServerCA.sh VerifyClientCSR.sh  VerifyIntermediateCSR.sh  VerifyServerCSR.sh

.PHONY: prepare-root prepare-intemediate prepare-server prepare-client prepare-all create-root-ca create-intermediate-csr create-server-csr create-client-csr create-intermediate-ca create-server-ca create-client-ca create-all verify-root-ca verify-intermediate-ca verify-intermediate-csr verify-server-ca verify-server-csr verify-client-ca verify-client-csr

prepare-root:
	bash prepare/PrepareRootDir.sh ${BASE_PKI_DIR}
prepare-intermediate:
	bash prepare/PrepareIntermediateDir.sh ${BASE_PKI_DIR}
prepare-server:
	bash prepare/PrepareServerDir.sh ${BASE_PKI_DIR}
prepare-client:
	bash prepare/PrepareClientDir.sh ${BASE_PKI_DIR}
prepare-all: prepare-root prepare-intermediate prepare-server prepare-client

clean-root:
	rm -rf ${BASE_PKI_DIR}/root
clean-intermediate:
	rm -rf ${BASE_PKI_DIR}/root/intermediate
clean-server:
	rm -rf ${BASE_PKI_DIR}/server
clean-client:
	rm -rf ${BASE_PKI_DIR}/client
clean-all: clean-root clean-intermediate clean-server clean-client 
clean: clean-all

create-root-ca: 
	bash create/CreateRootCA.sh ${BASE_PKI_DIR}
create-intermediate-csr: 
	bash create/CreateIntermediateCSR.sh ${BASE_PKI_DIR}
create-intermediate-crl: 
	bash create/CreateIntermediateCRL.sh ${BASE_PKI_DIR}
create-server-csr: 
	bash create/CreateServerCSR.sh ${BASE_PKI_DIR}
create-client-csr: 
	bash create/CreateClientCSR.sh ${BASE_PKI_DIR}
create-intermediate-ca: 
	bash create/CreateIntermediateCA.sh ${BASE_PKI_DIR}
create-intermediate-chain-ca: 
	bash create/CreateIntermediateChainCA.sh ${BASE_PKI_DIR}
create-server-ca: 
	bash create/CreateServerCA.sh ${BASE_PKI_DIR}
create-client-ca:  
	bash create/CreateClientCA.sh ${BASE_PKI_DIR}

verify-root-ca:
	bash verify/VerifyRootCA.sh ${BASE_PKI_DIR}
verify-intermediate-ca:
	bash verify/VerifyIntermediateCA.sh ${BASE_PKI_DIR}
verify-intermediate-csr:
	bash verify/VerifyIntermediateCSR.sh ${BASE_PKI_DIR}
verify-server-ca:
	bash verify/VerifyServerCA.sh ${BASE_PKI_DIR}
verify-server-csr:
	bash verify/VerifyServerCSR.sh ${BASE_PKI_DIR}
verify-client-ca:
	bash verify/VerifyClientCA.sh ${BASE_PKI_DIR}
verify-client-csr:
	bash verify/VerifyClientCSR.sh ${BASE_PKI_DIR}

