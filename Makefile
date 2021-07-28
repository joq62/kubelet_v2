all:
#	service
	rm -rf ebin/*;
#	interfaces
	erlc -I ../../interfaces -o ebin ../../interfaces/*.erl;
#	node
	erlc -I ../../interfaces -o ebin ../../node/src/*.erl;
#	application
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
	rm -rf src/*.beam *.beam  test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log catalog;
	echo Done
