%% Write a function which validates a greeting of "Hello, [SomeName]".
%% Validate as a list AND as a binary.

-module(greetings).
-compile(export_all).

%% Let SomeName be an argument to verify any name passed into a greeting.
%% Usage:
%% > greetings:sayhelloto("Joe").
%% > greetings:sayhelloto(<<"Mike">>).
sayhelloto(SomeName) when is_binary(SomeName) ->
  sayhelloto(binary_to_list(SomeName));
sayhelloto(SomeName) ->
  "Hello, " ++ SomeName ++ ".".

%% Then expand to support variable greetings.
%% Usage:
%% > greetings:saywhat("Hi there", "Joe").
%% > greetings:saywhat("Hello", <<"Mike">>).
%% > greetings:saywhat(<<"Goodbye">>, <<"Joe">>).
saywhat(Greeting, SomeName) when is_binary(Greeting) ->
  saywhat(binary_to_list(Greeting), SomeName);
saywhat(Greeting, SomeName) when is_binary(SomeName) ->
  saywhat(Greeting, binary_to_list(SomeName));
saywhat(Greeting, SomeName) ->
  Greeting ++ ", " ++ SomeName ++ ".".
