%% Write a function which validates a greeting of "Hello, [SomeName]".
%% Validate as a list AND as a binary.

-module(greetings).
-compile(export_all).

%% Let SomeName be an argument to verify any name passed into a greeting.
%% Usage:
%% > greetings:sayhelloto("Joe").
%% > greetings:sayhelloto(<<"Mike">>).
sayhelloto(SomeName) ->
  if
    is_binary(SomeName) ->
      string:concat("Hello, ", binary_to_list(SomeName));

    is_list(SomeName) ->
      string:concat("Hello, ", SomeName);

    true ->
      "Say hi to whom?"
  end.

%% Then expand to support variable greetings.
