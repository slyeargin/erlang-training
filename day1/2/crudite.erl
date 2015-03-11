-module(crudite).
-compile(export_all).

%% create proplist
%% Usage:
%% > A = crudite:new().
new() ->
  [].

%% read value of element from proplist
%% Usage:
%% > crudite:read(carrots, A2).
read(Key, List) ->
  case proplists:lookup(Key, List) of
    {Key, Value} ->
      Value;
    _Else ->
      none
  end.

%% update proplist
%% Usage:
%% > A2 = crudite:update(carrots, 2, A).
%% > A3 = crudite:update(celery, 1, A2).
update(Key, Value, List) ->
  Tuple = erlang:list_to_tuple([Key, Value]),
  List ++ [Tuple].

%% delete element from proplist
%% Usage:
%% > crudite:delete(carrots, A3).
delete(Key, List) ->
  proplists:delete(Key, List).
