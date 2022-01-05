%% Author: uabjle
%% Created: 10 dec 2012
%% Description: TODO: Add description to application_org
-module(kubelet). 

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Key Data structures
%% 
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Definitions 
%% --------------------------------------------------------------------
-define(SERVER,kubelet_server).
%% --------------------------------------------------------------------
-export([
	 load_start_pod/1,
	 stop_unload_pod/1,
	 state/0,
	 ping/0
        ]).

-export([
	 boot/0,
	 start/0,
	 stop/0
	]).



%% ====================================================================
%% External functions
%% ====================================================================

%% Asynchrounus Signals
boot()->
    ok=application:start(?MODULE).
%% Gen server functions

start()-> gen_server:start_link({local, ?SERVER}, ?SERVER, [], []).
stop()-> gen_server:call(?SERVER, {stop},infinity).




%%---------------------------------------------------------------
-spec ping()-> {atom(),node(),module()}|{atom(),term()}.
%% 
%% @doc:check if service is running
%% @param: non
%% @returns:{pong,node,module}|{badrpc,Reason}
%%
ping()-> 
    gen_server:call(?SERVER, {ping},infinity).

load_start_pod(PodId)-> 
    gen_server:call(?SERVER,{load_start_pod,PodId},infinity).

stop_unload_pod(PodId)-> 
    gen_server:call(?SERVER, {stop_unload_pod,PodId},infinity).
state()-> 
    gen_server:call(?SERVER, {state},infinity).

%%----------------------------------------------------------------------
