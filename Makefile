all:
#	service
	rm -rf ebin/*;
#	support
	cp ../support/src/*.app ebin;
	erlc -I ../../interfaces -o ebin ../../kube_support/src/*.erl;
	erlc -I ../../interfaces -o ebin ../support/src/*.erl;
#	etcd
	cp ../etcd/src/*.app ebin;
	erlc -I ../../interfaces -o ebin ../../kube_dbase/src/*.erl;
	erlc -I ../../interfaces -o ebin ../etcd/src/*.erl;
#	kubelet
	cp src/*.app ebin;
	erlc -I ../../interfaces -o ebin ../../node/src/*.erl;
	erlc -I ../../interfaces -o ebin src/*.erl;
#	application
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
	rm -rf src/*.beam *.beam  test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log catalog;
	echo Done
