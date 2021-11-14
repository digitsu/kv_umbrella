defmodule KVServer.CommandTest do
  use ExUnit.Case, async: true
  doctest KVServer.Command

  setup context do
    start_supervised!({DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one})
    start_supervised!({KV.Registry, name: context.test })
    %{registry: context.test }
  end

  test "commands", %{registry: registry} do
    assert KVServer.Command.run({:create, "shopping"}, registry ) == {:ok, "OK\r\n"}
    assert KVServer.Command.run({:put, "shopping", "eggs", "12"}, registry) == {:ok, "OK\r\n"}
    assert KVServer.Command.run({:get, "shopping", "eggs"}, registry ) == {:ok, "12\r\nOK\r\n"}
    assert KVServer.Command.run({:delete, "shopping", "eggs"}, registry) == {:ok, "OK\r\n"}
    assert KVServer.Command.run({:get, "crap_dummy", "beans"}, registry) == {:error, :not_found}

  end


end