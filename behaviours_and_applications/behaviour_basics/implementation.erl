-module(implementation).
-export([start/0, store/2]).
-export([init/0, handle_msg/2]).

%%% API
start() ->
    container:start(?MODULE, ?MODULE).

store(Key, Value) ->
    container:send(?MODULE, {store, {Key, Value}}).

%%% Internal Functions
init() ->
    {ok, []}.

handle_msg({store, {Key, Value}}, State) ->
    io:format("storing ~p~n", [Key]),
    {ok, [{Key, Value}|State]}.
