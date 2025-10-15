-module(bank_account).
-export([balance/1, charge/2, close/1, create/0,
         deposit/2, withdraw/2, start/2]).

start(Amount, IsOpen) ->
  receive
    {balance, Sender} when IsOpen ->
      Sender ! {balance, Amount},
      start(Amount, IsOpen);
    {balance, Sender} ->
      Sender ! {error, account_closed},
      start(Amount, IsOpen);
    {deposit, N} when N >= 0 ->
      start(Amount + N, IsOpen);
    {deposit, N} when N < 0 ->
      start(Amount, IsOpen);
    {close, Sender} ->
      Sender ! Amount,
      start(0, false);
    {withdraw, N, Sender} when N > Amount ->
      Sender ! Amount,
      start(0, IsOpen);
    {withdraw, N, Sender} when N < 0 ->
      Sender ! 0,
      start(Amount, IsOpen);
    {withdraw, N, Sender} when N >= 0 ->
      Sender ! N,
      start(Amount - N, IsOpen);
    {charge, N, Sender} when N > Amount ->
      Sender ! 0,
      start(Amount, IsOpen);
    {charge, N, Sender} when N >= 0 ->
      Sender ! N,
      start(Amount - N, IsOpen);
    {charge, N, Sender} when N < 0 ->
      Sender ! 0,
      start(Amount, IsOpen)
  end.

balance(Pid) ->
  Pid ! {balance, self()},
  receive
    {balance, Amount} -> Amount;
    {error, account_closed} -> {error, account_closed}
  end.

charge(Pid, Amount) ->
  Pid ! {charge, Amount, self()},
  receive
    Res -> Res
  end.

close(Pid) ->
  Pid ! {close, self()},
  receive
    Res -> Res
  end.

create() -> spawn(bank_account, start, [0, true]).

deposit(Pid, Amount) -> Pid ! {deposit, Amount}.

withdraw(Pid, Amount) ->
  Pid ! {withdraw, Amount, self()},
  receive
    Res -> Res
  end.
