defmodule KVServer.CommandTest do
  use ExUnit.Case, async: true
  doctest KVServer.Command


  test "commands" do
    assert KVServer.Command.run({:create, "shopping"}) == {:ok, "OK\r\n"}
    assert KVServer.Command.run({:put, "shopping", "eggs", "12"}) == {:ok, "OK\r\n"}
    assert KVServer.Command.run({:get, "shopping", "eggs"}) == {:ok, "12\r\nOK\r\n"}
    assert KVServer.Command.run({:delete, "shopping", "eggs"}) == {:ok, "OK\r\n"}
    assert KVServer.Command.run({:get, "crap_dummy", "beans"}) == {:error, :not_found}

  end


end