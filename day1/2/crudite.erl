-module(crudite).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

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
  List ++ [{Key, Value}].

%% delete element from proplist
%% Usage:
%% > crudite:delete(carrots, A3).
delete(Key, List) ->
  proplists:delete(Key, List).

%% tests

new_test() ->
  ?assertEqual([], new()).

read_test() ->
  TestProplist = [{carrots, 2}, {celery, 1}],
  ?assertEqual(2, read(carrots, TestProplist)).

update_test() ->
  TestPropList = [{carrots, 2}],
  ?assertEqual([{carrots, 2},{celery, 1}], update(celery, 1, TestPropList)).

delete_test() ->
  TestProplist = [{carrots, 2}, {celery, 1}],
  ?assertEqual([{celery,1}], delete(carrots, TestProplist)).
